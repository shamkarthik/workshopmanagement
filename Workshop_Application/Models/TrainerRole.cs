using System;

namespace Workshop_Application.Models
{
    public class TrainerRole
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string UserName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public byte? IsActive { get; set; }
        public string Skillset { get; set; }
        public string Experience { get; set; }
        public DateTime? DOB { get; set; }
        public int RoleId { get; set; }
    }
}