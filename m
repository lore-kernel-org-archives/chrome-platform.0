Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D75E44CF59
	for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 20:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406871; cv=none; b=Xj9aGReEFHQNZgHqa0IgZ8qA2syX1usatjsdnHtKV3HKXIEulJUmn+eJzHPoTB1pkPiK+dqc/3mzEMhMNaw+7wE2vnqYC0NEk2klLZnBp9+ccWBWCVtIK1bA3rbRhxXojhLdnjtWZ1Az+MCjkqeUSX8VErpC/6frlddrds3jzVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406871; c=relaxed/simple;
	bh=5qSEGoSFEbZ9Aw2s104tTg8FW55x+SU2f7LQRnzdTp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EN/uwQkjon4LUzzUoCdD5xKhr6Lx6sKithZN7Fl4ACJ7oyPO+P/gq9Z8NWWXtNHKxsZxERrsk/6+1QtiZlhRucpK55EcHQIn9tqhpaJxurclYadkZ7+A8hi2MMl+sxvAt+yndEUFatZgqEYtFnOmf8svlwDlHwnSDO15vGno1Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L84UPEG5; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L84UPEG5"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2eadb000b8cso3156670eec.0
        for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 13:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406869; x=1778011669; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63kFLuS2ZunRuwIKFamabno0yfYzwQFLWtzreaffIiA=;
        b=L84UPEG5AIkM6aN2Ry2gzVYjVGlKMzjYe8mkrZQcFLQaNOztGd0b1eUgwP0ejIyGsc
         6ANklfrl5rMeWC+dWFFNkeJKKm+w9NxR+WfFYppCukFmpxema769q9xVLXpyDz2C8xzu
         P3LNB4tV5jxKxAhKEJ7ExbArbEKtF3O+sYfII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406869; x=1778011669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=63kFLuS2ZunRuwIKFamabno0yfYzwQFLWtzreaffIiA=;
        b=IrCx0kV3w3WPQBDgeoKbKMQHEVeFW6MLLMVIYamWKwURQxxMY6r0M9q+vmmsa7jEdb
         onlz5ydUvaMKue7C8k530GaQjY6swjSEGzYdPgy7jjJ3oHsFS+dkM8w8yDMnTArfU0Af
         hKaeCyXII0QxHYPVgk4/DFZC5utpydluukNT86T7vxgmQLHjJ0PALSPKqPHOkY0y6Jdv
         kHdw7oH4vRyY69AUGzyelGkDJ4GqZPItdiX+HcQE9ncm7OBUl7zxcNbGt65fevNi06hy
         rhtNicY2tximTikl4nKV1AJyeOpjIViG+2Gxep0YJzOWMHYsxkHUErFdyyTw7uyuR9Cc
         UuzQ==
X-Forwarded-Encrypted: i=1; AFNElJ87rK8zxiEyeN6GAo1jvV5jgOUhoPK7cT/6KmjLESVHD5cbTvUjoOdCA8Gdo4NGLsFfWF+cnj7jRT/TG55J9JQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYyZQe0rHCjm5p5YZIGzQvjZoOqcveU+8DCX5WJ6uri8LOhrIi
	nyHpDXF6nWP6hRcdqPAmQ8xdB1zbpACJvczhBjIF7JCu1KghtIFDy/UHr/jZl5dZ+g==
X-Gm-Gg: AeBDiesYeKJdCpIhn3aWM4+wp/yfrWOCj8wWAzI6vIfkk+YTCtI6DokMRXnOE+cP3Ui
	Hris2lKwhC1e1/+ppKh5CoHtRMG20uB3F0GHuJoesq6/PYIoFhpeaWSWC+d1cTW/87eU7DlMVuO
	NMQjaGzDJf12hc7RNfnt7WX19MbmKtZCKvTJNneWNC+F5GXr8EDDk0FUfb3KmEzs6gjFxNdaZfC
	woeZJsxdjmCOi49/gdmZQmD/8grePVyGOnKcr0mU+pCg6zAh2LMxHGlj01wcnFVZo7g/af75YUB
	S7sNMmPWqkT0zsfbo+HPZJle05Ch6LmXmzeQf8B08xOGZRr6AejfpF9Wy+OcR73fmfxkvP1VJm7
	iPbjaW2PII1cISLM0cj2BR2eyXEFYNKjRMhvE6FIjBp75Tg5iAfXlEIpJKC92VDIO88toFQimZh
	h9DWHhNnXrK8cRelgqCKdN1YAYsh1Mm8f7WVP7s2N4JF99jvqCrWdXgIdvxA1E5Byv1FtR54xw
X-Received: by 2002:a05:7300:7255:b0:2ed:e12:3771 with SMTP id 5a478bee46e88-2ed1991b2a9mr467588eec.33.1777406869213;
        Tue, 28 Apr 2026 13:07:49 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed0a0ce761sm3064459eec.15.2026.04.28.13.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:48 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>,
	linux-rockchip@lists.infradead.org,
	Julius Werner <jwerner@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] arm64: dts: nvidia: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:58 -0700
Message-ID: <20260428200712.2660635-7-briannorris@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
References: <20260428200712.2660635-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chromium/Depthcharge bootloaders may dynamically add a few device nodes
to a system's DTB under a /firmware node. A typical DT looks something
like the following:

/ {
        firmware {
                ranges;

                coreboot {
                        compatible = "coreboot";
                        reg = <...>;
                        ...;
                };
        };
};

Notably, the /firmware node has an empty 'ranges', but does not have
address/size-cells.

Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
non-translatable addresses") started requiring #address-cells for a
device's parent if we want to use the reg resource in a device node.
This leads to errors like the following:

[    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22

Add appropriate #{address,size}-cells to work around the problem.

Note that Google has also patched the Depthcharge bootloader source to
add {address,size}-cells [1], but bootloader updates are typically
delivered only via Google OS updates. Not all users install Google
software updates, and even if they do, Google may not produce updated
binaries for all/older devices.

[1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
    https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
    #size-cells for firmware node")

Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 5 +++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index 683ac124523b..1f5222d43e62 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x80000000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index f0b8c2c80aa5..a6d31650245d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -25,6 +25,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0xc0000000>;
-- 
2.54.0.545.g6539524ca2-goog

