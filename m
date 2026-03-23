Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE8C1E515;
	Tue, 24 Mar 2026 00:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311122; cv=none; b=Ncrb7A7zk3r9cnBKwbN01muhVMQQlia/b9aP4bIboMwrK7lVmIb7z4v6jRdryYn9a5dTURyOpUiFG5Hxuy3nxlMNx1X1uHb4grOOsONOZa0Xyu6msJiUkkWLjzbceV6wPO5e84vz/MRv1wwF5gX1HN9cZXlZTX6dwuj+dNzGBM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311122; c=relaxed/simple;
	bh=BZbJm13p6v7uFdlnM0kKtK0kw8yT1avRjwVB64Na/7o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dKnxRb8fLj8mRfOSoHc007YTUCyF9PrI3hY5ww/LrnjcWdpeLk6E4G1KAlH4t7kur5gWVqGKRggpul9Zzw23Xmm+ZSgBXh49P6RtPAo7ajI1WThgJm4l+lJRm4hmEEPTV9YCUYH6TXHJktRI3vmRRcmVmuERSUsR1+0PHN6Tnww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5jrM1g2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5jrM1g2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F343C4CEF7;
	Tue, 24 Mar 2026 00:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311121;
	bh=BZbJm13p6v7uFdlnM0kKtK0kw8yT1avRjwVB64Na/7o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K5jrM1g2tyqh02781ZCofBxdfOJa5AeuqQBRehpGadrtFJkHXqdcRGeht8LNeB8BZ
	 wnlNZwrVhyrC/r2TLmI8LlwiO6e0sYpNbwVaLAK9WMg6TCUIVtlwIHp06aCXyVYq4w
	 Gc2rlipBVnNSjWlhvUY+v6OnmjekBcEA9X+uUcMdDNCKsxudLZUiRRzuDrIAM52srd
	 lsBYYTs0MXVixREYqFhtCQBIrFs3/YdCaT1n9zw6FHBXTvNpm/xEu0qmejb3DN2b3M
	 riBxd2/y+jPldyolcFW4HpkUCsadZYycV7tAy2B0c8xFStC8JdkVjtThnv3MhDdYOE
	 KcVPFoU266lzg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 chrome-platform@lists.linux.dev
In-Reply-To: <20260320083135.2455444-1-wenst@chromium.org>
References: <20260320083135.2455444-1-wenst@chromium.org>
Subject: Re: [PATCH 0/2] regulator: cros-ec: cleanup and add supplies
Message-Id: <177430554501.811880.4959580213615516944.b4-ty@b4>
Date: Mon, 23 Mar 2026 22:39:05 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BZbJm13p6v7uFdlnM0kKtK0kw8yT1avRjwVB64Na/7o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwdbOXyzix15AngIKGeCoU5IoLfda9/2BUmLmw
 ParSdlB6laJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacHWzgAKCRAk1otyXVSH
 0HbzB/9xIU3u7Z+zr1GTIUwKmtVL/HaOR+tHv7Dd1zvMFDjYaud3AO+A7Ou0rtX9wVSlclihAa0
 qzz09CEtPbgiH0gIJ+QJ29LdkY0HZo90sOFp0pAnnPZjAlCNV7piky8z32ib4/4afkquTY0RDh1
 11FaOv8v2Phr6Ry4R1JzGFzJGn5Dy96V4xKfqpcKQXlpstbsY78YNaP9m7IkNRkuD2MKbRVp0dl
 AS0XhuxxBp8nE/p5nA5njK6KcccA2blVW/0iw7gv7Ashx1uNrd/oxAZVLl4bPMyIW1YEUAxuWXd
 KQ+yKgkhBCJRrhUpuS7BfJ76IXB9M7SnKdPfWnHLpuajuUyK
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 20 Mar 2026 16:31:31 +0800, Chen-Yu Tsai wrote:
> regulator: cros-ec: cleanup and add supplies
> 
> Hi,
> 
> This series is part of a broader collection of regulator related
> cleanups for MediaTek Chromebooks. This one covers the regulators
> exposed by the ChromeOS Embedded Controller.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.1

Thanks!

[1/2] regulator: dt-bindings: cros-ec: Add regulator supply
      https://git.kernel.org/broonie/regulator/c/56b7c08a8b4b
[2/2] regulator: cros-ec: Add regulator supply
      https://git.kernel.org/broonie/regulator/c/411eb30f1382

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

