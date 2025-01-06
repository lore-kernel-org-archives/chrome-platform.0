Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A34360
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jan 2025 18:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736189558; cv=none; b=MpF0JfXAei7Z0wFHkDS4GGPZiURyWw5ojfjv2fpuxzJmmOQWESorxdgScMVfppe7YSapc2e5j67XbZNz+2c0HU2A4AVA70oO82mUvrjoyQeMAEyheaUSMLcxVbHa+a4+PuCGBWb4TvfBcElgWZ8UCs/MD262/lmzBy6G/91FqDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736189558; c=relaxed/simple;
	bh=5wX2O8GxGOPKuHUXzGpZp49GCnY2asE9FcoIiA1dJOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i6nQU/c/VtceOx/nhBx7oP/rkBtlLDbJqOodDUXYSej+w7SL13lknPkmJD3sO8Hh+d9dB0AXcb8nfknZ3ktHjXEB3+PDVWIEmiIj+Th1S4AIlZ0UruH1bGWfMyJD/bzEJ92SGTa8qcFfslLPqi4zjrcSF4dzEJdKibUoWvh5INM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZWetzJ+M; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZWetzJ+M"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-218c8aca5f1so15305725ad.0
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jan 2025 10:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736189556; x=1736794356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=plOTAJcGrWSp64BnH2/i1jyaeTJRaEo3VX8U0SpIaJU=;
        b=ZWetzJ+M0Bjiv2BDBtnFMcZWckIYu5zk8euWUdbKrV4jcD5oSG9W7wJvZ69B9L/VGQ
         SQI+qzCNm2RbCL51dL3tsUsu2UetTw8VQHc6wJaR8DAqjLehpuBB7n09QHY0TRQPo4VN
         r9sQGApvooIYcrF2Duims9/zUuKd4NzLvBEGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736189556; x=1736794356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plOTAJcGrWSp64BnH2/i1jyaeTJRaEo3VX8U0SpIaJU=;
        b=Tb/1LqB6UMjXhLu8z1UmplATo/p/vPgv+ktke+jyIzpv/i8MU1J6k4HwzHF9kqDWv/
         SaQsdVkbZ5bvWvgP9jvQTeDmge73grLOVIuNxQJWWfTiCMeIYnM+BbQy/mau8INumeSw
         DDuM2gAvRGJI7SR/UjDHqOc1mbyiMyQEvmM1QSDJxYm72hPNUCkaXrDWVjYWYr9WnXc/
         JIc1bndtaBYgCj4PkLOWFVRftHhoJehGAMOQK4NiSSnmJYHgTY71x5vImarNBYCTT1zE
         g8sTow/TSMEO/YwakXJt4uCtbTmew3nmbbOKq5q0IP5xgdqE5D5yqdkbMf1muiQgP3ek
         ce4A==
X-Gm-Message-State: AOJu0Yy6ujeht7z+s5y1sjBVoKH50HNrMd3wEizstvins9TlYGbeO4pQ
	X92nHFJcFmG4y5RXe0V6mzbHX2ObWC298flnDxQ2REdfseyJ6r///1Cv1D9TKA==
X-Gm-Gg: ASbGncvP7NJn278m8M95vch4JiIvMZL80U2utlTfHavoc68DablSFIVDKnDZ5JNZYS+
	bRvNYON1W90JVm34v0u8WGDQ2Y4SVF7LuRkCEesvFuCIzL/xiUufBCUxJ2VXgU4fnSllSf8FI3J
	zQts1vi5/PXV+REOYSus8w3IClA7CA3UXkbhOZm3ADxiTbd1PSjsLO8OmTzfy/6c+p2by9HmmHI
	9eOIgpUDyKwCJnPKAOLBjgbugjXQPIWJbLjNqhJ12jY61H5DE1TMtmU
X-Google-Smtp-Source: AGHT+IFID1eMblsa6YOQRJhcAKP356GzUOxP+jMv21c6AGcK8gkmDKHrEjUboexVPre6+vq6/YwHJQ==
X-Received: by 2002:a17:902:c943:b0:216:2e5e:96ff with SMTP id d9443c01a7336-219e6cd7bc3mr994223165ad.0.1736189556722;
        Mon, 06 Jan 2025 10:52:36 -0800 (PST)
Received: from localhost ([100.107.238.250])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc972ff1sm295970045ad.106.2025.01.06.10.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 10:52:36 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	dustin@howett.net,
	ben@jubnut.com,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH v2 0/2] Add support for IO memory mapped EC
Date: Mon,  6 Jan 2025 10:52:30 -0800
Message-ID: <20250106185232.1635556-1-gwendal@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some EC - Realtek - have their register IO mapped by the BIOS -
coreboot. They are not using the well know io register.

The memory mapping information is retrieved through the ACPI CRS
resource, and is used to access the registers.

To ease the support of these ECs, the global structure and accessor
funcions are now aware of the EC device private structure.

Gwendal Grignou (2):
  platform/chrome: cros_ec_lpc: Merge lpc_driver_ops into ec
    private structure
  platform/chrome: cros_ec_lpc: Add Support for direct EC
    register memory access

---
Changes in v2:
  Removed obvious comments, unnecessary case statement and fix error
  code return.

 drivers/platform/chrome/cros_ec_lpc.c | 203 ++++++++++++++++++--------
 1 file changed, 139 insertions(+), 64 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog

