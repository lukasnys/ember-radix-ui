// Easily allow apps, which are not yet using strict mode templates, to consume your Glint types, by importing this file.
// Add all your components, helpers and modifiers to the template registry here, so apps don't have to do this.
// See https://typed-ember.gitbook.io/glint/environments/ember/authoring-addons

// import type MyComponent from './components/my-component';
import type Accordion from './components/accordion';
import type AccordionItem from './components/accordion/item';
import type AccordionHeader from './components/accordion/header';
import type AccordionTrigger from './components/accordion/trigger';
import type AccordionContent from './components/accordion/content';

// Remove this once entries have been added! 👇
// eslint-disable-next-line @typescript-eslint/no-empty-interface
export default interface Registry {
  // MyComponent: typeof MyComponent
  Accordion: typeof Accordion;
  AccordionItem: typeof AccordionItem;
  AccordionHeader: typeof AccordionHeader;
  AccordionTrigger: typeof AccordionTrigger;
  AccordionContent: typeof AccordionContent;
}
