package sub1;

public class User3 {
	private String  userid;
	private String  name;
	private String  birth;	
	private String  hp;
	private String  addr;
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "User3 [userid=" + userid + ", name=" + name + ", birth=" + birth + ", hp=" + hp + ", addr=" + addr + "]";
	}

	

	
}
