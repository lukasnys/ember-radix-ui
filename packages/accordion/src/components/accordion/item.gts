import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { on } from '@ember/modifier';

export interface AccordionItemArgs {
  value: string;
  disabled?: boolean;
}

export default class AccordionItem extends Component<AccordionItemArgs> {
  @tracked isExpanded = false;

  get disabled(): boolean {
    return this.args.disabled ?? false;
  }

  toggle = () => {
    if (this.disabled) {
      return;
    }

    this.isExpanded = !this.isExpanded;
  };

  <template>
    <div role='heading' aria-level='3'>
      <button
        role='button'
        disabled={{this.disabled}}
        aria-controls='{{@value}}'
        aria-disabled={{this.disabled}}
        aria-expanded={{this.isExpanded}}
        {{on 'click' this.toggle}}
      >
        {{yield to='header'}}
      </button>
    </div>
    {{#if this.isExpanded}}
      <div role='region' id='{{@value}}'>
        {{yield to='panel'}}
      </div>
    {{/if}}
  </template>
}
