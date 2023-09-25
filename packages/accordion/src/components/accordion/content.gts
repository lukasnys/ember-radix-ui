<template>
  {{#if @isExpanded}}
    <div role='region' id='{{@value}}' ...attributes>
      {{yield}}
    </div>
  {{/if}}
</template>
