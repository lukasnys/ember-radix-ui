import type { TOC } from '@ember/component/template-only';

export const AccordionContent: TOC<{
  Element: HTMLDivElement;
  Blocks: {
    default: [];
  };
  Args: {
    isExpanded: boolean;
    value: string;
  };
}> = <template>
  {{#if @isExpanded}}
    <div role='region' id='{{@value}}' ...attributes>
      {{yield}}
    </div>
  {{/if}}
</template>

export default AccordionContent;
