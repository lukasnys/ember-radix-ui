import Component from '@glimmer/component';
import type { WithBoundArgs } from '@glint/template';

import { hash } from '@ember/helper';
import { tracked } from '@glimmer/tracking';

import AccordionItem from './accordion/item.gts';

interface AccordionSingleArgs {
  type: 'single';
  value?: string;
  defaultValue?: string;
  onValueChange?: (value: string) => void;
}

interface AccordionMultipleArgs {
  type: 'multiple';
  value?: string[];
  defaultValue?: string[];
  onValueChange?: (value: string[]) => void;
}

interface AccordionSignature {
  Element: HTMLDivElement;
  Blocks: {
    default: [
      {
        Item: WithBoundArgs<
          typeof AccordionItem,
          'selectedValue' | 'toggleItem'
        >;
      },
    ];
  };
  Args: AccordionSingleArgs | AccordionMultipleArgs;
}

export default class Accordion extends Component<AccordionSignature> {
  @tracked internalValue?: string | string[] = this.args.defaultValue;

  get selectedValue() {
    return this.args.value ?? this.internalValue;
  }

  toggleItem = (value: string) => {
    if (this.args.type === 'single') {
      this.internalValue = this.internalValue === value ? undefined : value;

      this.args.onValueChange?.(value);
    } else {
      const values = this.selectedValue as string[];
      const index = values.indexOf(value);

      if (index === -1) {
        this.internalValue = [...values, value];
      } else {
        this.internalValue = [
          ...values.slice(0, index),
          ...values.slice(index + 1),
        ];
      }

      this.args.onValueChange?.(this.internalValue as string[]);
    }
  };

  <template>
    <div ...attributes>
      {{yield
        (hash
          Item=(component
            AccordionItem
            selectedValue=this.selectedValue
            toggleItem=this.toggleItem
          )
        )
      }}
    </div>
  </template>
}
