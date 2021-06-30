namespace Workshop_Application.Models
{
    public class UserRole
    {
        public int UserId { get; set; }
        public string UserName { get; set; }
        public int RoleId { get; set; }
        public int WorkshopId { get; set; }
    }
}