Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8CD207670
	for <chrome-platform@lists.linux.dev>; Tue, 18 Mar 2025 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742293414; cv=none; b=YibvuG5XlQTRfbD+lrVhSbWdvw+ujBzRLKwlaTKpAQa1t0hsEHjsRBDbyOLrPgOYYFbGUga03GIfaoQPPb/rrfk5rJ2IAzEpZjMvZwBdfs3sHcC5pLPWCN1rDj+HdYg9jrND3sp87N/+vst6kIgFMlcDXniWr6kG/KholnHKsi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742293414; c=relaxed/simple;
	bh=cuaiaBEmZrkvp5X3aKQpBO5ytwvUyVSrBJ6UM1NIhYs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rPTw4NQRNQu3b1S8n5Z1+VxKA0J9mEOvIMIph5NK1BmcTzOOP4k+oWeTg8OYYETJWjBNCM0+vdbateSvGRphr9Rm5aOen602X2908ZgDhzutwvM8jYY0EP1FegwBJe7epeSNdXsD9IGrv28cwlRtyzZ3W/X2D+e2aF4quCs5Z+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XZpRy8Pm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XZpRy8Pm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742293403;
	bh=cuaiaBEmZrkvp5X3aKQpBO5ytwvUyVSrBJ6UM1NIhYs=;
	h=From:To:Cc:Subject:Date:From;
	b=XZpRy8Pmfg6bVrMTa33iLZFwQtrbcwV+GzjuWghlmwKnAoHM2OjNmPhWQVcq7kPcS
	 mfm0FuVScYgKpNfKuvZ6Z7hwl4aQ/vPdXi3bpbUwqt8Lzmt7uQoJY3dLZRU8rRKUUS
	 R/d5mM/4tyCpThjFA3E1plcPohSn8XxwgCylB0ErmjiIMhigrHGLH41zNkYu0DP1G1
	 bIOYS62dtGgl+gBqnsDQEfGonh/aGqDoCpryb1soZI1Q+8PvAQCWOsO0gYbgg+mtOV
	 lfWrUwTKKEflWWi0ixIRK/ravYOr6tTRFFyMEQJw2u7T7MreH/9PnAM+ShVzF56RT9
	 yRWyNGd7XM3Eg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:79a1:e959:3816:993])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C875517E00AC;
	Tue, 18 Mar 2025 11:23:22 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bleung@chromium.org,
	tzungbi@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	nfraprado@collabora.com,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH 0/2] Use ChromeOS DT hardware prober with MT8192 Spherion trackpads
Date: Tue, 18 Mar 2025 11:22:57 +0100
Message-Id: <20250318102259.189289-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series marks the trackpads for the Google Spherion variants as
"fail-needs-probe" and makes them compatibile with the ChromeOS DT hardware
prober.

Laura Nao (2):
  platform/chrome: Add support for Google Spherion in HW prober
  arm64: dts: mediatek: mt8192-asurada-spherion: Mark trackpads as
    fail-needs-probe

 .../arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 7 +++++++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi           | 6 ++++--
 drivers/platform/chrome/chromeos_of_hw_prober.c            | 4 ++++
 3 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.39.5

