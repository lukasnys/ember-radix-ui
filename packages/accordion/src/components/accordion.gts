import { hash } from '@ember/helper';

import AccordionItem from '@ember-radix-ui/accordion/components/accordion/item';

<template>
  <div data-orientation={{this.orientation}}>
    {{yield (hash Item=AccordionItem)}}
  </div>
</template>
