import type { TOC } from '@ember/component/template-only';
import { hash } from '@ember/helper';
import { WithBoundArgs } from '@glint/template';

import Trigger from './trigger';

export const AccordionHeader: TOC<{
  Element: HTMLDivElement;
  Blocks: {
    default: [
      {
        Trigger: WithBoundArgs<
          typeof Trigger,
          'value' | 'isExpanded' | 'disabled' | 'toggle'
        >;
      },
    ];
  };
  Args: {
    value: string;
    isExpanded: boolean;
    disabled: boolean;
    toggle: () => void;
  };
}> = <template>
  <div role='heading' aria-level='3' ...attributes>
    {{yield
      (hash
        Trigger=(component
          Trigger
          value=@value
          isExpanded=@isExpanded
          disabled=@disabled
          toggle=@toggle
        )
      )
    }}
  </div>
</template>

export default AccordionHeader;
