import Component from '@glimmer/component';
import { hash } from '@ember/helper';

import Header from '@ember-radix-ui/accordion/components/accordion/header';
import Content from '@ember-radix-ui/accordion/components/accordion/content.gts';

export interface AccordionItemSignature {
  Element: HTMLDivElement;
  Blocks: {
    default: [{ Header: Header; Content: Content }];
  };
  Args: {
    value: string;
    selectedValue?: string | string[];
    disabled?: boolean;
    toggleItem: (value: string) => void;
  };
}

export default class AccordionItem extends Component<AccordionItemSignature> {
  get disabled(): boolean {
    return this.args.disabled ?? false;
  }

  get isExpanded(): boolean {
    if (Array.isArray(this.args.selectedValue)) {
      return this.args.selectedValue.includes(this.args.value);
    }

    return this.args.selectedValue === this.args.value;
  }

  toggle = () => {
    if (this.disabled) {
      return;
    }

    this.args.toggleItem(this.args.value);
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
