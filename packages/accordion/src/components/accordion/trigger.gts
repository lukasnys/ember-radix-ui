import type { TOC } from '@ember/component/template-only';
import { on } from '@ember/modifier';

export const AccordionTrigger: TOC<{
  Element: HTMLButtonElement;
  Blocks: {
    default: [];
  };
  Args: {
    isExpanded: boolean;
    value: string;
    disabled: boolean;
    toggle: () => void;
  };
}> = <template>
  <button
    role='button'
    disabled={{@disabled}}
    aria-controls='{{@value}}'
    aria-disabled={{@disabled}}
    aria-expanded={{@isExpanded}}
    {{on 'click' @toggle}}
    ...attributes
  >
    {{yield}}
  </button>
</template>

export default AccordionTrigger;
