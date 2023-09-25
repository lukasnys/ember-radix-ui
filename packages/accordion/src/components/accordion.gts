import { hash } from '@ember/helper';

import AccordionItem from '@ember-radix-ui/accordion/components/accordion/item';

<template>
  <div ...attributes>
    {{yield (hash Item=AccordionItem)}}
  </div>
</template>
