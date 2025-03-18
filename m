Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A96207DFD
	for <chrome-platform@lists.linux.dev>; Tue, 18 Mar 2025 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742293415; cv=none; b=FKv2vnjIcOZbSM4dGmTYIiIwSjAvD9FzPqahkGjZXO6pOn5mv5ffGIBa7/pnq+nuHAhCdgLQKogDLun1YOIEpMVx3uacKA30blfaQ7fUsYpIEaLlsLpWix/c9m3YY4USVMzugmwWnieZim06H7jaVbq74Z7yPCTI23WjRHGYDBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742293415; c=relaxed/simple;
	bh=+wbnDO1Pqe10oOmycZARCAUSDWGZz6dvqzpBhlHSIvg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=smFtPY3Bp5Z8/MMw4M2Bm/nSf5FnUAqlK11Qof4ah/IXLO7+4A9vMKTD+8MTU9KVoXYECSSBb9LhiwvcwpLuc5519Zq4yRuRdZK+UfZmUkdL72wxe3QzsraqslBLfZHiBaN2g3gz0IxA06yRg5ZYpzP2uMKuAoGkBgq/kydt+ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mY6PtpEj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mY6PtpEj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742293404;
	bh=+wbnDO1Pqe10oOmycZARCAUSDWGZz6dvqzpBhlHSIvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mY6PtpEjVeZ8GPVcNf/GEFUg+ElLuY0lhio+IPbUtzIMkQL0i32Bc86SdIXKG5L6P
	 5T9vJvNFnRwtOqGGxRT6Egi3BQWwDmaSPjCCw/aOf+PGK9+EuzClWiYyIVC9UzrWHH
	 mkziT0mvvGqcCVoqt3IR+wTLkGfbNm51ET8GgvoGGbLde/9KHK8UAQW4YHuEm5F5L1
	 1xYDkw8s+l8+K6yq4Bv8DvlWbBfgkHESxFJR5IA+fRKbQl3QRNQVFG0ShLtZ6ZAXry
	 8qBbH5XLVd3Hpa7s7JMEEsV3BZcug8z1C7OeWSvZLjF2JX8ihLRJUsV1B7gD4RF2kf
	 Y+iP2JUsRfSbw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:79a1:e959:3816:993])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E960017E05A6;
	Tue, 18 Mar 2025 11:23:23 +0100 (CET)
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
Subject: [PATCH 1/2] platform/chrome: Add support for Google Spherion in HW prober
Date: Tue, 18 Mar 2025 11:22:58 +0100
Message-Id: <20250318102259.189289-2-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318102259.189289-1-laura.nao@collabora.com>
References: <20250318102259.189289-1-laura.nao@collabora.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new compatible entry for "google,spherion" to the hardware prober
platform list, using the same I2C component prober and trackpad data as
"google,hana".

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index c6992f5cdc76..019578bc7ad0 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -84,6 +84,10 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,hana",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_hana_trackpad,
+	}, {
+		.compatible = "google,spherion",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_hana_trackpad,
 	},
 };
 
-- 
2.39.5

