Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8844D3CD8C9
	for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 20:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406860; cv=none; b=E5msU9kXN0r0nb+33r2EVLuvrZ0uSzpBMhIVaPZov4z94FYKHwskVdF5cy9PmKpCLxsqrFxYzm0TlXcVySuorMqnr7XgGs1/UYJ9kQdq+8FIKrSavToivyOsJZ9TwPcHb1vI5cp87WovFoovpBIIzfwxRUvW/4dAOzb37PNgZvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406860; c=relaxed/simple;
	bh=XO1A/HibqZZptlBWN5BCzJBPBBT6OtgGPpR1fmvJiA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PyT2KqmpEedKxmnlMnDipIcffYR2SmskKU6eKkkWD+CbTClwwXs8oDzZjI6fez7Wv31gsIjuLAcCxabOzcMG+DXFe0+E3lrR5EK9ItH4CL/FChq5iPiVcOLEldeKc+Pg1/zdC6uENj0iljXniZJ4ZcDc8MQUm7pLUCyodYg5xaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZsYcF1gZ; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZsYcF1gZ"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2d8ffdc31d0so4709905eec.0
        for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 13:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406855; x=1778011655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyEh8MUYI6uV1LBlX4TWKPlLf6Jaa4vkUqpt47EeXpM=;
        b=ZsYcF1gZ8CULovaCDlAUsihMrV5aXisIcuR8IbLIun++6OLYkmTj7YggX95XgPJ0Cm
         JhD4vlzunPgvl3uEP2bLgmsf/HPExKhjLSuY/xwV2kGP3EaEPrOjf+C3LeZxpQBsVpxz
         xlCXBsu94ryMkZ7Jk4e9JxCjamWwxfgsq5H/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406855; x=1778011655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wyEh8MUYI6uV1LBlX4TWKPlLf6Jaa4vkUqpt47EeXpM=;
        b=IHp02EeQt4bUIDrLklfNz1twA//lrnL2kb/c+OEz9ZEww5x6MHetlHgJwWr2jn6TUt
         39DPvx427EirUcOFwAUMeGV37EeUByvLrXfzdixrHFnElAwUi71WJ1y1YypaqB5LQOYs
         rhevRfvu/P3NM5Gb6Hk2/8hUusyws4nIBpZeSI9mNZqobrVdOMqN9RiBpB0hwIOf/AZq
         t03vuN3OZsE5vH3HVgGOR3XTrszgGNUKPZQnY8fG5WxSYsKsvrif8y6Tgq2AjE3U04lc
         jd45k6YS7nGufVhLdSJvVq4o1FKW0tieeUeDMi7ganGYxe3Xm/SHhHrqYDto0krUN/Nw
         t52Q==
X-Forwarded-Encrypted: i=1; AFNElJ/vHQKDSMnQDyjVX3GyydvrCipVaayeQn2VZs6FjWEEpP/s8wajJl2dbIqI8MMTH090jDxKViFGbiuCapYE81M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2uvwu/+nooe5Fv8SU8PO0yqdbil+wX/cSQumpypCoK3MEiyMm
	fopsTfexY+RICoiuZRHtYy9KHCaTF08P38zlYou2/X5wcgBhC1AvNMxJdzeqjMtUlg==
X-Gm-Gg: AeBDievz9IBUIm/AlI8dY01E+x4GI8qQgyu3FrYB9XYbuBe3RBxU8KbzQo/1X4eYPIb
	550SU8EHDMZeGUng+dP7l9GPDkqjVsKNAECCy2+FQaVOYR7m8GdoUnl60e+sNvU6ir90zReCo2P
	8ON0KQif2c8527dD293QS3wfeMBMzNi3kNdHuw+cMx0X1NPuGDvqQQhjXX+yOCjsYjlRHBcoRbj
	7cOJvQk9YrF4JqbTLYijPT4PsQJUv4dhdAE4zEH5aRG/W9CI5KKOMunqvs6ksKOOl/5CL3ioFWR
	xDjFDnaAR3kVKCU8pixg3yw7atIyapF6VHY0hy0QiHVyq/wBAslFN+kAUdSdEC3fCSvVnhlucbq
	Blca0kxh8luH8zfpdmhn6GJOlz7AL05Nh5frPbF+FoPCWB7J91eFzoqIBzL88eo3WFPbqoTwyQx
	S3NSUjtCLcbT837IGk0ALFVpEOAaLbjqe7Sap9N4yXgqs/Xw+TdMeoYm6N35PdnnlaiKMemJhB4
	x7HZFKrgmo=
X-Received: by 2002:a05:7300:5707:b0:2ed:e15:c924 with SMTP id 5a478bee46e88-2ed0e15ce32mr1940281eec.32.1777406854721;
        Tue, 28 Apr 2026 13:07:34 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed09fb6b8asm3015155eec.8.2026.04.28.13.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:34 -0700 (PDT)
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
Subject: [PATCH 2/7] ARM: dts: rockchip: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:54 -0700
Message-ID: <20260428200712.2660635-3-briannorris@chromium.org>
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

 arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi b/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
index 2d6cf08d00f9..ca8e8e735078 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	/*
 	 * The default coreboot on veyron devices ignores memory@0 nodes
 	 * and would instead create another memory node.
-- 
2.54.0.545.g6539524ca2-goog

