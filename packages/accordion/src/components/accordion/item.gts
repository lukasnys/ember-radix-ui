import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { hash } from '@ember/helper';

import Header from '@ember-radix-ui/accordion/components/accordion/header';
import Content from '@ember-radix-ui/accordion/components/accordion/content';

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
    <div ...attributes>
      {{yield
        (hash
          Header=(component
            Header
            value=this.args.value
            isExpanded=this.isExpanded
            toggle=this.toggle
            disabled=this.disabled
          )
          Content=(component
            Content value=this.args.value isExpanded=this.isExpanded
          )
        )
      }}
    </div>
  </template>
}
