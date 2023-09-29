import Component from '@glimmer/component';
import { WithBoundArgs } from '@glint/template';
import { hash } from '@ember/helper';

import Header from './header';
import Content from './content.gts';

export interface AccordionItemSignature {
  Element: HTMLDivElement;
  Blocks: {
    default: [
      {
        Header: WithBoundArgs<
          typeof Header,
          'value' | 'isExpanded' | 'toggle' | 'disabled'
        >;
        Content: WithBoundArgs<typeof Content, 'value' | 'isExpanded'>;
      },
    ];
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
