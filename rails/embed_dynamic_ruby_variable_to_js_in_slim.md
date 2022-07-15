```rb
@data = { a: 1, b: 2 }
```

```slim
javascript:
  const ctx = document.getElementById('myChart').getContext('2d');
  const data = #{raw(@data.to_json)}

  const myChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
```
