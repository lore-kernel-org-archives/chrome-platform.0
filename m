Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ED43CD8C2
	for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 20:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406854; cv=none; b=Tcy6z/VE8gLjStKIEDNgTD3mwWkP8uNePdoa94YnPE25NqjA+Vzr4hw9qxLYg+gk6qEQQxKllKq1dNoVrk48ZSHwTeVsfLSRQz6/BCxK+AFAoKHb1DUHq5LAEk/ZUPBYcl0T/QGo4cogsE4+p1M3nCeovcjQRx2ELoFQRP2+upc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406854; c=relaxed/simple;
	bh=xlJmeP+PJelIrVWVbvw6zF4EvPRmj3ee8OfUipPJo0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d0UoOWjFNP92GvVFVflwh8HDje3RSuT78VVJsioeQgZChc6P4OUDH9iAmvVFOXA1AGpdnCNMvIA92mLGnAnCRT8F0GthZHODoHfv+493yv7xzUgQFSnMfGD+lCF7Fb7pKFworBHIasEk3SVmOyeUAzjt080kVdbjnhXdXorBbMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LQMsRdvX; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LQMsRdvX"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2d9916deb14so20717613eec.0
        for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 13:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406851; x=1778011651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZddyefkooDQKnc5O6I7CXwcRuSu4lPrXGIxW3LQfo4=;
        b=LQMsRdvXznSWJGREIWpTDVKsafJ0Zu77NWdxhhIJPd9DqqkOoHCi+KyQihyxtbyEdj
         ix3gwZAVKY9nykE63Dew8ivtllGh/e+SSX/H18jC37OY04Eb8De77OgsCl/cp5H2vmNN
         jTwVnsA/2DoPxHnkxBpv+Q7O+WgdmfBXS3moM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406851; x=1778011651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oZddyefkooDQKnc5O6I7CXwcRuSu4lPrXGIxW3LQfo4=;
        b=WkqVgmTVFNoDfVNQ7RD9jrSBaWmWubtayT2yyZJ99R7A6moSFBT1rqa3rGd5GY/KuB
         DWjSTR8KP/MossaKciSzx49VraobqzjlWYjeDXI5ASSmzBpKtA0MlfiugDgNLh5MwT43
         iz3yLcpGdUj0rzrXKs7jZlKzjgF4NXwRbj/bQcn8ZkCOWlwf4oshwB83OwGbSdhwoqag
         ME3vixOiH60RpVRzU05n+GUuu61VsOTXFbeW7DKodGqoTQFHO35Kqe7Nmav/8AxXXze8
         Cw+4iudsJzMNakdTJqdPiLIGPNaaFb2eLN2JKLKA8Q3ngPM3L5oAaVCGdq9BpDzvIMFt
         Bikg==
X-Forwarded-Encrypted: i=1; AFNElJ/sikUGpZYC02ks/eClp1ztAqAszhw7rgmwaxApUB3SIkFZ5tXqTcjQpntURc5pv6ww/UZAs/phNJYU9+N0Zu0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp3PEMVcCxJWfR6OSUS2r/MzF4hFcUXyJKReieUR6RajsFJunE
	YQz00uGJZOa4Upu2Mn1uAB1qJINw5lFVdAlbxw+9FNqn1fCLBb/b9fmybovmq908Kg==
X-Gm-Gg: AeBDieuZkQ4CH3ChviGx93bpxd9XHXoCK7OtYrkJYBHZSaQP7t7oWtMFmUhIwAUrQPS
	waxzi1tUmfWB8U+n6mlBYulx4amap90fBYd+KbWwqBTXKudNErS2k7Jf7Q9K3ZNN2wB/cgeN4iO
	XXHLYNswQI0D1GrbS3lQMMcP8Q89JwenIhtqN0TEd1beJVsH+I8yoibu+s2ksMwvt+Qh5/e54d9
	eB0fLlJeWegSMeV7kHnrT5fCLsrUblEjMw5IgcoQN9B14iAqdmUUzoGTELOafNrcbr+yG3o9Nrv
	oC/93zdjWmOAG/gSf7fKh4yC2ZMk7fMV4+qTnMYSJwSfcFja2v44Hk+XrAQGbNCTaxRedY76SGt
	OYLiTNnLOoueTHoICnNlIlnhowgPU42csEWutZswVCJwoFAJwtuOtm0vFCHdxZ8yUqY9v9W+sFB
	psxoAuMnBNDUxwxgHpAQGbkjH9qOFATFzexKdYXu6esyh/ph6xGfKcMQ5Mc5JsrZG9pa9cDof9
X-Received: by 2002:a05:7300:fd08:b0:2ed:e17:d50b with SMTP id 5a478bee46e88-2ed0e17d6eemr1499097eec.30.1777406851181;
        Tue, 28 Apr 2026 13:07:31 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed0a10650esm2873589eec.22.2026.04.28.13.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:30 -0700 (PDT)
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
Subject: [PATCH 1/7] arm64: dts: rockchip: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:53 -0700
Message-ID: <20260428200712.2660635-2-briannorris@chromium.org>
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

  ## From a RK3399 Gru/Kevin Chromebook:
  # find /sys/firmware/devicetree/base/firmware
  /sys/firmware/devicetree/base/firmware
  /sys/firmware/devicetree/base/firmware/coreboot
  /sys/firmware/devicetree/base/firmware/coreboot/ram-code
  /sys/firmware/devicetree/base/firmware/coreboot/compatible
  /sys/firmware/devicetree/base/firmware/coreboot/board-id
  /sys/firmware/devicetree/base/firmware/coreboot/reg
  /sys/firmware/devicetree/base/firmware/coreboot/name
  /sys/firmware/devicetree/base/firmware/chromeos
  /sys/firmware/devicetree/base/firmware/chromeos/readonly-firmware-version
  /sys/firmware/devicetree/base/firmware/chromeos/active-ec-firmware
  /sys/firmware/devicetree/base/firmware/chromeos/firmware-version
  /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-storage
  /sys/firmware/devicetree/base/firmware/chromeos/vboot-shared-data
  /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-size
  /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-offset
  /sys/firmware/devicetree/base/firmware/chromeos/hardware-id
  /sys/firmware/devicetree/base/firmware/chromeos/compatible
  /sys/firmware/devicetree/base/firmware/chromeos/firmware-type
  /sys/firmware/devicetree/base/firmware/chromeos/fmap-offset
  /sys/firmware/devicetree/base/firmware/chromeos/name
  /sys/firmware/devicetree/base/firmware/ranges
  /sys/firmware/devicetree/base/firmware/name

The /firmware node has an empty 'ranges', but does not have
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

 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 7eca1da78cff..2f9e39671efc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	/*
 	 * Power Tree
 	 *
-- 
2.54.0.545.g6539524ca2-goog

