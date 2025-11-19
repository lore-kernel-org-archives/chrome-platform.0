Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A4B2F2910
	for <chrome-platform@lists.linux.dev>; Wed, 19 Nov 2025 07:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763536312; cv=none; b=WIPDhWnb19xNnqQrwaWtdbyS5HzaUQWCqFVogFtW2FAzKpicxfs2+/e1q4FTj1v7gU8gqpKY3GdtFPsl5OLpxbv/5BwJsa+AzotSsr0syHZBZNKFjqmS8cnkd2/MIiqo2bQ9mAkTyBtR+vZtryBROrSsDN4YqX2Y4bxQpm8IVLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763536312; c=relaxed/simple;
	bh=lewKTD6NLFHdDtQ7f7/vxDFUy37j58RvCE9wZLaqFZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XgD3T5PreIvqFHWEYVxFZ1qOhCqKP+eMVfsnlhGeV9IAq5S7z1sfC8SJIxh+iFVpTKIY42otwLCNOEe6HGjY31P1uQdMjHnuJ3ooPMjkxZxLcM88eS6+ytHmxdafeWUdP7/wv6UBnv4vNUVaWhnKhi/Vp/OTf3TA/KJTkGWPCt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LzTYZjsc; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LzTYZjsc"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-298250d7769so43841155ad.0
        for <chrome-platform@lists.linux.dev>; Tue, 18 Nov 2025 23:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763536309; x=1764141109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kYHfBeSzfHHxVu3uMn0kynACtSYKaWfSTnHHUJabxhI=;
        b=LzTYZjscrjDueUB6PUfalzfVaBXsxv/sn8hqP/Kkuxe+pNRQFsA8xq4mZr3faDcix+
         kZtO4G9o4hZhhNwT1REt6EuxfPXQ+1HyTVBkKkoeirZvR94hO587tEd9CQ3xT2R5DHv9
         yKL/2/eVtkMhx1Aohrj1HCSGFg9xidyfsZFj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763536309; x=1764141109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYHfBeSzfHHxVu3uMn0kynACtSYKaWfSTnHHUJabxhI=;
        b=G/CKSi4slsN+pQNLS60IVVrffI8dNhJ2+nsFL/y6ZHwjsRxKxmLxRfPH9kqmyGdh0O
         c4NKE/BrmraaAalnCKqXSVz4ZPwUg6ij9pD17w0S2EBrmqdQpvrTPd6asEzpK7o1T/J9
         8tii5oHBnvugpF6r4ZN9Fg12TSUSpdp9DvgxkJgfGqqIJEuwmMAkPit6Ipi4e7KNMATV
         ZTCQXrxKkLpUrk4rSCeo/qUdoc9tghj5BKci2vyYSS7inkgKBA1CYPvtua1Vf37gWApb
         rxN6wnhJkI1MIkIH7KjLWXgY29kne4SnIgoT986K4yqRxCIGhGWhCUQwkm1nLYdym0AM
         2OKA==
X-Forwarded-Encrypted: i=1; AJvYcCUytNEWxvGI77TSi4mHvYZNTwLZ5Gu61TuCj+H5cpNhxlI8QyB/eektEAbak1fMT8mGxnAQ2NXatVGHC6qzLQw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2FAcreCMN9KUvX2uRl8efgdsD3TdRXKTKa0sJ2WuFXyQXZM/j
	lmXiP6IwHWABPXst6NVsEZS6nR96fQpBXssVNSLGyzD5Sh7jLYqz0SGExv3o2cg0PQ==
X-Gm-Gg: ASbGnctRU51ArX+AbtggLsw8OXrPDHxyW0Ioocokza0uHPMUen0vxgE8AUZG1VnO5hB
	jFikKhhzrBWsbY132FrdkHdEVdnWRa6FZCYBI0G+Pk/dCtHMP1P06k69Wjjho7MciGVVBX12dyK
	Hc1hit3cMhrrEVT9TyEto7xEOJDj+9HFh6hL8OnD+Bn0ypdimiHWrN6fYiTHRvknsLN79oMOihS
	s4TjRc9rKGYVzCnxCZtxuQO3jjJzaX5jyUA5XlM46hWC7FREwT2vYdgWIITn+LOMV3MbkmMG8Bn
	PjDLCHDVHG1jE7yFxM2EdP5N+3vsEMEGgC7Si6HXS4jhEq3CwQpsqoIlRqhgaiaMG9J/0C+G8Y9
	hMws+unXgN94CL+Vbzh0oNY9A0a5AjBfj77oxQ8rvpT9Lk6PlZuF3RVZhS1ayRCnbBFL3Qrhjf9
	UCIhbk+cBFaUb+C7R7+Z//1TVZ4jv9BTm1PhndYbKg6WuMY0GHMmuZhIHHmGX3g4jDob71
X-Google-Smtp-Source: AGHT+IGNuUZZklbSnAwcwjH0fvBJN9XmBWel6ilOI6vt+JGrwzQllOqIu2jGWlXL11D1C3baD1ynRg==
X-Received: by 2002:a17:903:247:b0:294:ccc6:ccfd with SMTP id d9443c01a7336-2986a6bf3b3mr209119565ad.24.1763536309538;
        Tue, 18 Nov 2025 23:11:49 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:d42c:6a2b:5251:a121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf1ddsm197554725ad.92.2025.11.18.23.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:11:48 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: firmware: coreboot: Document optional device specific properties
Date: Wed, 19 Nov 2025 15:11:25 +0800
Message-ID: <20251119071126.1719405-1-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coreboot, or the ChromeOS second stage bootloader, depthcharge, will
insert device specific properties into the coreboot firmware node when
there are valid values.

Document these properties in the binding.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/firmware/coreboot.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/coreboot.txt b/Documentation/devicetree/bindings/firmware/coreboot.txt
index 4c955703cea8..0d04ea482aa9 100644
--- a/Documentation/devicetree/bindings/firmware/coreboot.txt
+++ b/Documentation/devicetree/bindings/firmware/coreboot.txt
@@ -21,6 +21,15 @@ Required properties:
 	0xc0389481 that resides in the topmost 8 bytes of the area.
 	See coreboot's src/include/imd.h for details.
 
+Optional properties:
+- board-id: Contains the board revision number.
+- ram-code: Contains the board's DRAM configuration type.
+- sku-id: Contains the device variant SKU ID.
+- fw-config: Contains the device variant FW config value.
+
+The optional properties are only populated if the values parsed by coreboot
+are valid.
+
 Example:
 	firmware {
 		ranges;
-- 
2.52.0.rc1.455.g30608eb744-goog

