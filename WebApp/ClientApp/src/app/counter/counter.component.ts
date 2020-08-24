import { Component } from '@angular/core';

@Component({
  selector: 'counter',
  template: `
      <h2>
          {{currentCount}}
      </h2>
      <button (click)="incrementCounter()" class='counter-button'>Click</button>
  `,
  styles: [`
      .counter-button {
          font-size: 1rem;
          padding: 5px 10px;
          color:  #585858;
      }
  `]
})
export class CounterComponent {
  public currentCount = 42;

  public incrementCounter() {
    this.currentCount++;
  }
}
