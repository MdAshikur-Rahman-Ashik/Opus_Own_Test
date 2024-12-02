namespace Opus.Models
{
    public class Order
    {
        public int OrderId { get; set; } 
        public int ProductId { get; set; } 
        public int OrderQuantity { get; set; } 
        public DateTime OrderDate { get; set; } 

    
        public Product Product { get; set; }
    }
}