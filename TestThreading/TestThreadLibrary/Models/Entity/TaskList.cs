//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TestThreadLibrary.Models.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class TaskList
    {
        public TaskList()
        {
            this.MinMaxAvgThreads = new HashSet<MinMaxAvgThread>();
        }
    
        public int Id { get; set; }
        public string TaskName { get; set; }
        public System.DateTime NextExecution { get; set; }
    
        public virtual ICollection<MinMaxAvgThread> MinMaxAvgThreads { get; set; }
    }
}
