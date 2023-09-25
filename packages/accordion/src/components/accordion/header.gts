import { hash } from '@ember/helper';

import Trigger from '@ember-radix-ui/accordion/components/accordion/trigger';

<template>
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
