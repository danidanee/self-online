package not_yet;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.security.MessageDigest;
import java.util.ArrayList;

public class 서울_2반_송다은_블록체인구현 {

	// 구조체 선언
	static class Block {
		int nonce;
		String data;
		String prevhash;
		String hash;

		public Block(int nonce, String data, String prevhash, String hash) {
			super();
			this.nonce = nonce;
			this.data = data;
			this.prevhash = prevhash;
			this.hash = hash;
		}
	}

	private static void gethash(ArrayList<Block> block, String data) {

		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			int nonce = -1;
			String prevhash = "";
			if (block.size() != 0) prevhash = block.get(block.size()-1).hash;
			
			while (true) {
				
				// 해시 값 계산
				String base = prevhash + data + ++nonce;
					
				StringBuffer hexString = new StringBuffer();
				byte[] hash = digest.digest(base.getBytes("UTF-8"));
				
				for (int i = 0; i < hash.length; i++) {
					String hex = Integer.toHexString(0xff & hash[i]);
					if (hex.length() == 1)
						hexString.append('0');
					hexString.append(hex);
				}
				
				// 처음엔 그냥 저장, 00000 일때까지 실행
				if (block.size() == 0 || hexString.toString().substring(0,5).equals("00000")) {
					block.add(new Block(nonce, data, prevhash, hexString.toString()));
					break;
				}
			}

		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}

	}

	public static void main(String[] args) throws Exception {

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// 계산한 값 저장을 위한 ArrayList
		ArrayList<Block> block = new ArrayList<>();

		//입력
		while (true) {
			System.out.println("data를 입력해주세요. (-1을 입력하면 종료됩니다)");
			String data = br.readLine();

			// 함수 호출
			if (!data.equals("-1")) {
				gethash(block, data);
			}
			// 종료
			else {
				for(int i=0; i<block.size(); i++) {
					System.out.println("\n" + "nonce: " + block.get(i).nonce);
					System.out.println("data: " + block.get(i).data);
					System.out.println("prevhash: " + block.get(i).prevhash);
					System.out.println("hash: " + block.get(i).hash);
				}
				break;
			}
		}

		br.close();
	}

}
