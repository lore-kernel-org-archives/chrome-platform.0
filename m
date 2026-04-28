Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440333C7E0B
	for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 20:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406851; cv=none; b=YYGHARDmWz/GtEFujSdpEBxGzXbR/hgALmMpXX45QiCLS1BI45r8Vwvg2MqPA6lLwg7VdoMz4X3XHpV4GRYua4d5CCx/DeGMXhH8SqSssKkg9i5fz0ia1yz97ZkzrpOrldl7lhjli8S4zW1rX+V1xgkCZh/TPJzDz1l5YUNKG2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406851; c=relaxed/simple;
	bh=ksXQeqM5axRgUsGjCWqfJTytSjsUbB4ll76rBVY/214=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DcMZ2qONL+mJl1qA8I2pqwQG/PWipQX2+/uyu4sFGxY1m6WFuZzvAwLzRIjN7MAv5Fhp3Dh2YVXp4QFvovH3xn7pQs+d7YK9GwGbn3Rk5qmafbtZt27QK0h1dzkp/CAnCAHlSc1KGAzFsHvqLqRHpA3CguZBT1dGbBv3y6Fpw+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O45UO9jy; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O45UO9jy"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c45281a06so16320412c88.1
        for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 13:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406848; x=1778011648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKQRvM+woDu6KBLreGPcHmP1j9kbXpV/WZYBI8HqOII=;
        b=O45UO9jyo4K0ptqDrQmE7MOBEKrY991Jw60IvLz3yTy13sJD8l5+80Y12XzIlW/Moa
         TsDo9S46bqKRS/0azjNQEpv7H52YS/rqXYJFe+7Qn3ObD3BAmhbTgxYUMXMtpH2N8IwM
         JDnsZ82K9xAAlCGtMCLBLQuc7ayZsAI/fs8j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406848; x=1778011648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKQRvM+woDu6KBLreGPcHmP1j9kbXpV/WZYBI8HqOII=;
        b=o1NBk9idKEfMqVxp7K5G34oQ3IgGYKsK2q4vjBc+pPtSvq1nKDlcWMBb7elNrPadMz
         rHf+yJr6ROoGvhmuM44IEykKitTnEFjSQ930a7ERilYMrKzx/cL5pgPoSuOyLkfTULr0
         REMNsWq0y6XOuR1nD3zF4+NOWWxk94gfJp4Mt0vmRc6KrwG7gqBEVa1emafO+35SE8Nn
         7ZLIx1O76QvDggoiZzn/OeTD7JfnrlqR2r1+FO9NdPx34JB4eqYJs2rWs7XNRFFbUCV8
         jfs74C8zpWTtCzKYUFBnnbgpoSH5u1hSlgUWW9naCBWm/T7KA+cLi0JlV4hFaRK+ZRKD
         1amg==
X-Forwarded-Encrypted: i=1; AFNElJ9wbIkJ9v0MokfV+XPxeo58XxJS2qT+nusdrIplL2U44KuoOCvqT/eESqzskisD67eLlJvHnbCrS6VkBllee2w=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrDV3idOuYCrdcg0Ah83kKflfCzySe+M2w2+Rw1fVLND4aI2Ah
	y6bn8or2YzYvDDqC/M/kwRPmAmlCsYTOddgPpUhRQYlOO/75YlQ7S/Iax5GMUCc76A==
X-Gm-Gg: AeBDieuzoQFsUFqJTUEZwVR0/FUL4ECcuI6f+rA4Kwy0hO0sCaRWymzlX7VkmiEzusE
	zo7EQpXFXqwDcGtAHD80DnGIbwKW9ZN0rXUZMTKGkfN0CvHj/vqnI7AAVt+Th66PGGUNvkvQgU9
	DY4ZihIDsLZhww803/OyZfmfir310pEY9bySyvtoZ3nOsxc4F7yiixymasnJvgPCzMmf5cGOX3l
	7Brj+le3Su1luKYDwAiZpCzoEvzj/Xhwe5Ns1+4l+3+nm70QuVlfqmbcRZzHPFUwc58jEAjqkeQ
	+mkAjgFUPgIvsZ7d/MIxgbqEQXr78NnZAieKI63n3aCkQwQBquB26ys9RPXRNUSAxYloIbMeE8O
	sYrPeDsqj7ugzo65uBFHtPi9LArtA75rp/ha14a0S3NbPlm7XJ+VUuGx5KU7Cog6IMiYIyz5yzw
	txa0PMY5t59viVz0ATQSl0Ul7UiTr8dW9F/W87w2wFsd7idRdwIQtR9hLE4F/KyeuAGYgNTj6A
X-Received: by 2002:a05:7022:fe06:b0:12d:de3f:d84d with SMTP id a92af1059eb24-12dde3fdd97mr1431757c88.38.1777406848179;
        Tue, 28 Apr 2026 13:07:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12ddd93abadsm2784062c88.6.2026.04.28.13.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:27 -0700 (PDT)
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
Subject: [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to Chromium-based DTs
Date: Tue, 28 Apr 2026 13:06:52 -0700
Message-ID: <20260428200712.2660635-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
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

This series adds appropriate #{address,size}-cells to the device trees
used on Arm Chromebooks to work around the problem.

Note that Google provides bootloader updates for some devices that add
{address,size}-cells [1], but these are only delivered via Google OS
updates. Not all users receive Google software updates, and even if they
do, not all devices still receive bootloader updates from Google.

This problem was first noticed in OpenWrt, where some Chromium-based
routers ran into the same issue:

https://github.com/openwrt/openwrt/issues/21243

Relevant OpenWrt fixes: https://github.com/openwrt/openwrt/pull/22951

There is also discussion at [2].

I've currently only tested:
1) the aforementioned OpenWrt routers (with non-upstream DTS/DTB)
2) RK3399 Gru/Kevin Chromebook (patch 1)
3) Qualcomm SC7280 Herobrine (patch 7)

I assume the others should follow the same pattern. I don't know if I've
covered every relevant Depthcharge-using device, but I've made a good
attempt to identify them all.

I reviewed Depthcharge code history and found that this problematic
bootloader behavior dates back to at least 2014, with the Tegra/Nyan
device. Older devices may have similar DTB structures, but I'm not sure
if they have the same address-cells problems. In any case, these changes
shouldn't hurt even if a device was not affected.

Brian

[1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
    https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
    #size-cells for firmware node")

[2] [regression] of: mis-parsing Depthcharge's /firmware
    https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/


Brian Norris (7):
  arm64: dts: rockchip: Add #{address,size}-cells to Chromium-based
    /firmware
  ARM: dts: rockchip: Add #{address,size}-cells to Chromium-based
    /firmware
  ARM: dts: nvidia: Add #{address,size}-cells to Chromium-based
    /firmware
  ARM: dts: samsung: Add #{address,size}-cells to Chromium-based
    /firmware
  arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based
    /firmware
  arm64: dts: nvidia: Add #{address,size}-cells to Chromium-based
    /firmware
  arm64: dts: qcom: Add #{address,size}-cells to Chromium-based
    /firmware

 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi           | 5 +++++
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts         | 5 +++++
 arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi         | 5 +++++
 arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi | 5 +++++
 arch/arm/boot/dts/samsung/exynos5250-spring.dts       | 5 +++++
 arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts    | 5 +++++
 arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts     | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi          | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi        | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi      | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi       | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi      | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi       | 5 +++++
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts        | 5 +++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts         | 5 +++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi          | 5 +++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi        | 5 +++++
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi          | 5 +++++
 18 files changed, 90 insertions(+)

-- 
2.54.0.545.g6539524ca2-goog

