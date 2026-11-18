Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992307;
	b=VFD2inEhmg4FSIiRBuoc/WROP/KvVTGcuEezTzPGruNWtBV4ZBLAxlEXtU1DrLDfOYYd
	 1gToEhNArNFoiDC64qy4IMgistTKBr6MGhXouZVoOFIcmMlSfnCl04AGpdZRSq48wgAdY
	 kBjZrLQJWU6wR6wsWKRo8zqLK0+BlLY1CvVsn7Ft8yrYRtKRf2iXCUtsiUu5IEoZaXd/2
	 CTB0BXiYOdHfiVT32/tRNzFvguUnF7a0ZABPaEq91Itz7Uzaxfc9Xlza6ut5gEfWjxqr4
	 iSm5MO66U8QsupRB5mndgJ+l4QItTfNdvIfcux+IHTeKAAX/mBLEkGzY+p8eDbB2J8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992307;
	h=DMARC-Filter:DKIM-Signature:X-Original-From:In-Reply-To:Subject:
	 X-Lms-Return-Path:Message-Id:Mime-Version:Received:To:Date:References:
	 X-Mailer:Cc:From:Content-Transfer-Encoding:Content-Type;
	bh=kEr9Wg+aGMoays9Uh761p22Cq/vcC6/mglbKhWQGwFU=;
	b=GC5npb66BmFJtzxtO7I5wMc3Mu7O0ZYA1LbuFpYc6N8IsRMutoC8al2JDeLgkhNHOGNA
	 g+I+K5PywwVsTFCq++d7+7/PKFmEsGO1+lkc0dmtaj9xCfTqBzBdhk9EnoWkV5Ct05IuY
	 g1qovTBYwWcIoBUaLdv6p15Z8c0JAIRCUCSPATfuhpUpMo3eU8XjhdZp4E5Vytt/GbOL7
	 dXHt4P8xQVTXCOQ8k9mbeQXlU8cvP4Eej1tbaCYOTTuRH3RcpmLsoiZMhx5wLazMPYLJH
	 FYQOVs4w/2u8IPueiaM/L6Tx5/U3aN5OoQgvQKeMLE0kgrnyrpqfZJ0iDCsaAkYjX/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=NT7Fwi35;
	arc=none smtp.remote-ip=209.127.231.16
Received: from va-2-16.ptr.blmpb.com (va-2-16.ptr.blmpb.com [209.127.231.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDA3606A331
	for <chrome-platform@lists.linux.dev>; Wed, 18 Nov 2026 08:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDDA3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=NT7Fwi35
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992302;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=kEr9Wg+aGMoays9Uh761p22Cq/vcC6/mglbKhWQGwFU=;
 b=NT7Fwi35WYG8eyjqbJshaEWz596512Btcq5FAovqfyWG4z9R3fBynpDhhAUJVSYkJSFWYq
 tQfxvAG1xUe0H1C5pq1f7J1TlzavnFd19gXQZZrdzx9CHyH1WjAG2CmlFfyUmlb+xiAIyP
 hPBj+7fSEoa0scvO1ZWCj/lnTqI4CJGEilYo9zxiL/EvWmhb/Z54+Ae67io5GkQpBCzY9f
 l+1WV5zGH6Cc0TxxPeqcY2y2xNpDUMxkuQVZWc0wJH0ztU+ruWrPb+MEqN3iLQSZEDGt4a
 8eEjgu80RzNAwWigtK+Kh4CeJDIZv7Gt5q1m4dPgX0UEERrhV9Smu9qQaWfzhA==
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
Subject: [PATCH 9/9] riscv: defconfig: Enable the FML13V05 EC keyboard modules
X-Lms-Return-Path: <lba+26afd68ac+57a195+lists.linux.dev+yang.wang@deepcomputing.io>
Message-Id: <20261118085742.1817536-10-yang.wang@deepcomputing.io>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:58:19 +0800
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
Date: Wed, 18 Nov 2026 16:57:42 +0800
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
From: "Wang Yang" <yang.wang@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

Enable the eSPI controller and Chrome platform configuration menu. Build
the EC core, memory transport and keyboard driver as modules so OF
modaliases can load them on boards that describe this hardware.

Keep all configuration choices in this final standalone patch.

Prepared with Codex assistance from the existing DC-linux EC support.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 arch/riscv/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 383fdd07a..1ddb8cd5f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -145,7 +145,9 @@ CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_MOTORCOMM_PHY=y
 CONFIG_INPUT_MOUSEDEV=y
+CONFIG_SPACEMIT_ESPI_BUS=y
 CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_CROS_EC=m
 CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
@@ -277,6 +279,9 @@ CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
 CONFIG_PHY_STARFIVE_JH7110_USB=m
+CONFIG_CHROME_PLATFORMS=y
+CONFIG_CROS_EC=m
+CONFIG_CROS_EC_SPACEMIT_K3=m
 CONFIG_LIBNVDIMM=y
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_EXT4_FS=y
-- 
2.43.0
