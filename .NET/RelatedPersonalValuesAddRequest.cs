    public class RelatedPersonalValuesAddRequest
    {
        [Required]
        [Range(1, int.MaxValue)]
        public int PersonalValueA { get; set; }
        [Required]
        [Range(1, int.MaxValue)]
        public int PersonalValueB { get; set; }
    }
