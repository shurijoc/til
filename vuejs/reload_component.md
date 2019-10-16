componentにkeyを渡してそのkeyを更新する

```
<template>
  <component-to-re-render :key="componentKey" />
</template>
```

```
export default {
  data() {
    return {
      componentKey: 0,
    };
  },
  methods: {
    forceRerender() {
      this.componentKey += 1;  
    }
  }
}
```
