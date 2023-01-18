#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_timer_regs.h"
#include "sys/alt_stdio.h"
#include "alt_types.h"
#include "io.h"
#include "unistd.h"
#include "sys/alt_irq.h"

int count = 0;
int cent, dix, unite, tmp = 0;                // pour adaptation  a l'affichage des valeurs
static void IRQ_Timer(void *context);         // fonction interruption du Timer
void convertion_valeurs_pour_affichage(void); // fonction pour adaptation affichage sur 7-segments

int main()
{
    alt_ic_isr_register(TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID, TIMER_0_IRQ, IRQ_Timer, NULL, 0);
    IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE, 0x7);
    while (1)
    {
    }

    return 0;
}

/*fonction interruption Timer*/
static void IRQ_Timer(void *context)
{
    if (count == 1000)
    {
        count = 0;
    }

    convertion_valeurs_pour_affichage();

    IOWR_ALTERA_AVALON_PIO_DATA(SEG_0_BASE, (cent << 8) | (dix << 4) | unite); // affichage sur 7-segments

    IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0); // re-initialisation du Timer
}

void convertion_valeurs_pour_affichage()
{
    tmp = count;
    cent = tmp / 100;
    tmp -= cent * 100;
    dix = tmp / 10;
    tmp -= dix * 10;
    unite = tmp;
    count++;
}