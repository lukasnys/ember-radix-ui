import { on } from '@ember/modifier';

<template>
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
