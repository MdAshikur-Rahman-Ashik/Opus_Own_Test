using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Opus.Data;
using Opus.Models;

namespace Opus.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly AppDbContext _db;

        public OrdersController(AppDbContext context)
        {
            _db = context;
        }

        [HttpGet("{productId}")]
        public async Task<ActionResult<IEnumerable<Order>>> GetOrdersByProductId(int productId)
        {
            return await _db.Orders
                .Where(o => o.ProductId == productId)
                .ToListAsync();
        }

    }
}
