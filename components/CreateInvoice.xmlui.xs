function getTotalAmount (lineItems) {
  // If lineItems is not present, use an empty array
  const items = lineItems || [];

  // Sum the 'amount' fields, treating missing amounts as 0
  const total = items.reduce((sum, item) => {
      const amount = item.amount || 0; // default to 0 if amount is undefined or null
      return sum + amount;
  }, 0);

  return total;
}
