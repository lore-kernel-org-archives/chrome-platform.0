Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C3C3D47C4
	for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 20:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406867; cv=none; b=DdDgV+BeIGL3iwr+/SvdRQ29ghgKrrbbhJYGgYw7N1W6cZNeRzwUd8Z5WqKUY1M5asOWasvbOAJvBN57jX8sXM9jmDLMZCyQ+zVe7Jd85oAXXYmqkzqph6qRj8jzQ2H0+YR+lZ5k7hI6jc3YNpXOEXzHkhOwXvbUP8dm8L3iLe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406867; c=relaxed/simple;
	bh=70ZUw+XXwGiBv0Z/9jZE4a1D1ZLPbnBPjY6fYI2V8PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GsasW62kZh3lBwx8eUul3SYyhkcbtj9jfhJ8iT/s5r/wHKd6oOP+ftA3kyhhYYQodBXpLGAokkn88HFSofUxt/2+9u3PvbOI5D1N4V8lq0Oa2pjhg+FzoxV1TMjD6uvicPEonmmuF0Vmc5b/DMY0utSwRgAtlu78yir0Qr5AWes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DqJwLqSy; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DqJwLqSy"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2dec803f9f0so164103eec.0
        for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 13:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406862; x=1778011662; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwWtduOWgbcJH/5sVxzLGAMHPFkXvP7oJuezZGoggcs=;
        b=DqJwLqSy+610+yEmSLHi6E73HTWTjebq+7CB81+s7aDPYXbRhRfwzSh1X8V+pu35W9
         EBSWBJHknhS9cYtat7YmoQEaXpjwT1YPg7UDgZK7dXI78DP5pLdOYhmsxWpdO72Ixd5f
         8m/T+bI+NsHyIpuMHGwjdyXwxYBVLliiqi3Zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406862; x=1778011662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iwWtduOWgbcJH/5sVxzLGAMHPFkXvP7oJuezZGoggcs=;
        b=kCo6joXo9M+XX/kn41ZL+oa+yTGkUqZ0D6u6ULVn23eRJ9eY1brgRqGblPyUOcl+Bn
         baWydonoUiaIK7pZDiSg5LumH77BaUBB4ObnOibPlmruq/XnpqaLS9wbGjyPXgPJ/flF
         owX6dSPQrSBk569EGX3qLpuhYzW6cR+IoDQfyHTMAuJ+FjPTL3SpCG11j6XcWmwGmFZD
         8Bu6R4zgW7x1aXDq9iBE6ka4KXFHceVVfnxFOWvuJcfssczOt/JJH2QhIQQO/AN8Icqx
         2X/W2rzGkETuLNlPJ0qNiqcLviscOlYNbIA4vkdQVkObh94i6KMaXSjDSbW9U7aBby3H
         0buA==
X-Forwarded-Encrypted: i=1; AFNElJ9UvLQSCtDfYsDAvBWfuSh6jo6KAzsXzOeGPESHCsxzfWBjvrZcU8ry7iQoPZwO6Ms4IR9NUMlP4UNM40Gvals=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPUuVnvROqdct9mjgPGae1HzHZmlWPUYO2grLvoGxEbJ18MEwD
	N1w6ebndyCC9TZjoMche/M5mm3pX7WJzHgb0gz73Z3VI2uhhFOLTyl5cE+6zIUxtDkzQ5KDENRw
	kSis=
X-Gm-Gg: AeBDies3FNp0diHmgZIxmQSQioBXgiYtiQYFRisgRnqNY1WyHaCYMvT31KEU/jAvNpC
	Of9IEetpepXQK7I7Se36aIpPD6hNoeHe0RU+0kJ+QOKhZf3vMhb/YtNdF0bVBISu+5b8PwCNAuu
	iu08n/RCCvAWQitxWYCyMqXaWyNlmskbwZkOzBn3jfmHa3fHKhowztRVyE7M5Nn9GMAdNSBxcxS
	B7R4lm8230AQX68pl8S0WxeinqQ3+I7vzUd/yNezx6WoNUHrtnnm4cw7uB+teR3gAtxmg/SK0IG
	2EZ4qWuRLPC+tqHHnfyTTm1T49XWCV/44D1W105w2cFvO2fCigEVvmTsCN+SKIGp45Xme3h/ZNL
	12AYJ5eNgxYXEnqaIO+YZNV4ZGXvHbhDtk/jGP4bI+4sdQtI4TWTIYNZ458edbBgCmK6+Va6052
	KGV7gwOMwz6wkTwWWGSCAyhuyo2NN0QHnK1SMvorzsIkbRTHJjEjdFjB1NNbbf528L5GY4uJvP
X-Received: by 2002:a05:7301:3d17:b0:2be:ca4:e114 with SMTP id 5a478bee46e88-2ed1b4057a0mr129402eec.9.1777406861689;
        Tue, 28 Apr 2026 13:07:41 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed09fb712bsm3068754eec.12.2026.04.28.13.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:41 -0700 (PDT)
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
Subject: [PATCH 4/7] ARM: dts: samsung: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:56 -0700
Message-ID: <20260428200712.2660635-5-briannorris@chromium.org>
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

 arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi | 5 +++++
 arch/arm/boot/dts/samsung/exynos5250-spring.dts       | 5 +++++
 arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts    | 5 +++++
 arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts     | 5 +++++
 4 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
index 65b000df176e..a64cdec3a2ef 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
@@ -30,6 +30,11 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/samsung/exynos5250-spring.dts b/arch/arm/boot/dts/samsung/exynos5250-spring.dts
index d126fccdcaf3..a337fd9e3473 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/samsung/exynos5250-spring.dts
@@ -33,6 +33,11 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts b/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts
index 3759742d38ca..f24356784492 100644
--- a/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts
@@ -50,6 +50,11 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	fixed-rate-clocks {
 		oscclk {
 			compatible = "samsung,exynos5420-oscclk";
diff --git a/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts b/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
index bb019868b996..3df27eddba15 100644
--- a/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
@@ -49,6 +49,11 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	fixed-rate-clocks {
 		oscclk {
 			compatible = "samsung,exynos5420-oscclk";
-- 
2.54.0.545.g6539524ca2-goog

