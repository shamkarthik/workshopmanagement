namespace Workshop_Application.Models
{
    public class WorkshopParticipant
    {
        public string Username { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public int WorkshopId { get; set; }
        //public int ParticipantCount { get; set; }
        public int ParticipantAttended { get; set; }
    }
}