```mixins/utility.js
export default {
  methods: {
    toPriceString: (price) => {
      return '¥' + String(price).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    }
  }
}
```

```index.vue
<p>{{toPriceString(1000)}}</p>

<script>
  import utilityMixin from '../../mixins/utility.js'
  export default {
    mixins: [utilityMixin]
  }
</script>
```
