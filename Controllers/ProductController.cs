using Microsoft.AspNetCore.Mvc;
using WebApplication3.Models;
using X.PagedList;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
namespace WebApplication3.Controllers
{
    public class ProductController : Controller
    {
        QltiemhoaContext db = new QltiemhoaContext();
        public IActionResult Index(int? page)
        {
            int pageSize = 12;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lst = db.Flowers.ToArray();
            PagedList<Flower> lstt = new PagedList<Flower>(lst, pageNumber, pageSize);
            return View(lstt);

        }
        public IActionResult CatoListItem(int catid, int? page)
        {
            int pageSize = 6;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var listhoa = db.Flowers.AsNoTracking().Where(x => x.KindId == catid).OrderBy(x => x.FlowerId);
            PagedList<Flower> lst = new PagedList<Flower>(listhoa, pageNumber, pageSize);
            ViewBag.Catid = catid;
            return View(lst);
        }
        public IActionResult itemDetailed(int id)
        {
            var sp = db.Flowers.SingleOrDefault(x => x.FlowerId == id);


            return View(sp);
        }
        //below
        [Route("addcart/{productid:int}", Name = "addcart")]
        public IActionResult AddToCart([FromRoute] int productid)
        {

            var product = db.Flowers
                            .Where(p => p.FlowerId == productid)
                            .FirstOrDefault();
            if (product == null)
                return NotFound("Không có sản phẩm");
            var cart = GetCartItems();
            var cartitem = cart.Find(p => p.flowerincart.FlowerId == productid);
            if (cartitem != null)
            {
                // Đã tồn tại, tăng thêm 1
                cartitem.quantity++;
            }
            else
            {
                //  Thêm mới
                cart.Add(new Cart() { quantity = 1, flowerincart = product });
            }

            // Lưu cart vào Session
            SaveCartSession(cart);
            return RedirectToAction("Index");

        }
        [Route("/cart", Name = "cart")]
        public IActionResult Cart()
        {
            return View(GetCartItems());
        }

        [Route("/checkout")]
        public IActionResult CheckOut()
        {
            // Xử lý khi đặt hàng
            return View();
        }
        public const string CARTKEY = "cart";
        List<Cart> GetCartItems()
        {

            var session = HttpContext.Session;
            string jsoncart = session.GetString(CARTKEY);
            if (jsoncart != null)
            {
                return JsonConvert.DeserializeObject<List<Cart>>(jsoncart);
            }
            return new List<Cart>();
        }
        void ClearCart()
        {
            var session = HttpContext.Session;
            session.Remove(CARTKEY);
        }
        void SaveCartSession(List<Cart> ls)
        {
            var session = HttpContext.Session;
            string jsoncart = JsonConvert.SerializeObject(ls);
            session.SetString(CARTKEY, jsoncart);
        }
        [Route("/updatecart", Name = "updatecart")]
        [HttpPost]
        public IActionResult UpdateCart([FromForm] int productid, [FromForm] int quantity)
        {
            // Cập nhật Cart thay đổi số lượng quantity ...
            var cart = GetCartItems();
            var cartitem = cart.Find(p => p.flowerincart.FlowerId == productid);
            if (cartitem != null)
            {
                // Đã tồn tại, tăng thêm 1
                cartitem.quantity = quantity;
            }
            SaveCartSession(cart);
            // Trả về mã thành công (không có nội dung gì - chỉ để Ajax gọi)
            return Ok();
        }
        [Route("/removecart/{productid:int}", Name = "removecart")]
        public IActionResult RemoveCart([FromRoute] int productid)
        {
            var cart = GetCartItems();
            var cartitem = cart.Find(p => p.flowerincart.FlowerId == productid);
            if (cartitem != null)
            {
                // Đã tồn tại, tăng thêm 1
                cart.Remove(cartitem);
            }

            SaveCartSession(cart);
            return RedirectToAction(nameof(Cart));
        }
        [HttpPost]
        public IActionResult Checkout() {
            
            return View(); }

    }
}