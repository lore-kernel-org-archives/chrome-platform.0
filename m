Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169D333FE33
	for <chrome-platform@lists.linux.dev>; Sat,  1 Aug 2026 16:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785603418; cv=none; b=XT2e8fallheSjoN7/Ob03rl4qkhSBsdVhrUsoIL8zMktNZjjM5xzXchAPl7kC9qz8wWStGDU8xQ/VrN4FAnQa3hCQQE4hHmW55WfS54CZBqVjYYtRFtK2pBwguLRoezDj09Kc5P+RKwaEEra6kHbNhYlOa4s6h4dakXXQG+fubU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785603418; c=relaxed/simple;
	bh=55m4GcqtjjIlAZ04VJ0fFzT7ftTDxncElGf5Mjb0gD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pAU9sD0/BCTy5hYxC3VD9yk57pb4eRh8kn23gIhQcektMzUrL2VAv5BUIb45BZ8r1u4ntYLpH/EqEGTpNQRv+bMQDVw8kyResgvBhyGwXxb/xwzr6Nv4PrXFC/pcnQ3lsmlkbJblSt68CNGmDCyU6bfEFOTb/8K9T0omFVEvsQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQHptACS; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQHptACS"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbb662575d3so1130706a12.0
        for <chrome-platform@lists.linux.dev>; Sat, 01 Aug 2026 09:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785603416; x=1786208216; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HjMWRfiVIu7TeYsuq/V8tfzJguz72HRc/qV1HUb8BFM=;
        b=rQHptACSPiQTjivH7kh8+D50Ypby6j9FkvftB0PNdlKGBB+EfNPp5W/M6Ze/KD1jA1
         6qB4UOtb1c7i9hrG5qk7X0Qai648mKyEKRA6glsSxx4xMlQB0enYbhGJsGKX2VgFaTU4
         g+N7/PRwaJHmo6sWHIxPm3jxkJCvFylN2hBv4ub+Nzmb4LICGVmoiek3WqMwtZ9hwoNp
         kCN95AnczsXFEK9XyiEoa2HsGuuGZgepD1z9PAheIyPKgTOcjcbC42gicWxm9MPaeCLc
         hkHVIDZw78phyZ1bxS8jl+a9dWXPnXjU+49r/HLbG4l+HZZfwIbJtWR1qLXM/RDeTtCs
         XUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785603416; x=1786208216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjMWRfiVIu7TeYsuq/V8tfzJguz72HRc/qV1HUb8BFM=;
        b=iLOT5XqTbZKx07tDW3BUhIh9kcA+wbLkmZkZKBJiXy4w9iPwRZWEr/S/T/yndqZAWn
         wpSB28TKSuk/Up4iXww1E39kVbK9+JBp04GED5LIrSZEmJFZrGOktAA40LXEUi/+9kmb
         5V6jtv4qjvOi6MUS2Ql2JAZpM+xGX9zjyH3k3if09nEvb4gH5o0Subji3Roif20cA44c
         pZykW8xQ7RIfmBv8Et+1Si2MTNyt2PZZ5WnL9ubczycIwaVF2cqQwXS1WV5UsS1f28pp
         15RmmVLFgzljzWMD+P+B4stuzRO3JT3rAWm0J+rDk32OhBlVuLYPqYQE6ZqH3D3e4Zch
         s0ow==
X-Forwarded-Encrypted: i=1; AHgh+RrpUcpdSwJyQgPa13OPrDpaKGUU+zj4RTAwSiHWw3OemAoWSSnBwiENNyl8JSSm2cIwJoaPQD12nFp9YqGggoA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzNd0fi3ZsXn5kjFJ3gK/DCReKVcwabRt7jZHM5Mt0pwcCcDUO
	x1pC0veL5G9qtYTcSKUaA55iiLXugH6aoO+SkY6YEHCWn2yiLPRPqA6c0wlZkPl8
X-Gm-Gg: AR+sD13arB4DrRatoqToXdqq21cnfnBNpuVVhabuKxI7yB2ht6xpk/ojGnHG8DHMYNU
	2yPWiCMEk/0iz0s4YKYnY+FbFsTBurnA8J9XsbTb568yAjK8HFnx2kvpEltjBzGSVI959L1erT4
	SKr72idtS2ovXE5y/6inJORerv6MIjTdFM48DEmd1Hh0oWo1NkhLYRCKyzUvCUQ3GumrbmJiy3f
	FxwO0iLCojReBQEcYLdcnUTt+4elBhwDP2bUSC+kVq7+ekytosngLK0hHlSezdfdkvuALUz1Wbu
	oCXomBD2mEArJIWoAB9kXAbs5a9wFjLnpzLJKX9EpaQtl7OJzPJ7j8IALw8aHuVX4XsP4tTMiz8
	FZz0rifJiJykZXdeAPBnKd7GM7sZipm0C/2mTngn0moMCloo3kgji1u2XmUy7VrFXgPAu6ti6Vq
	Ioafc7FF50wugQcjgEIoQjD63WIo7cOefEbnyTYDF0Ga8xBbHb2YmyJ3C47yXYWbRNu6Zg1hkPZ
	YCKBlIm3x4NV9kxKsUM43UT0xJYzEHAk02pmacycRrsCfGe8Uz4GWnoIWKrE5FGC2Bu9nGxudIk
	urb6IJRFenyF7AgOXS8=
X-Received: by 2002:a05:6a21:9985:b0:3c1:657:4c95 with SMTP id adf61e73a8af0-3c92a75a3b5mr4272815637.15.1785603415998;
        Sat, 01 Aug 2026 09:56:55 -0700 (PDT)
Received: from localhost.localdomain ([2405:acc0:1306:9d5b:7865:f907:f2bf:8664])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4cb51asm24110366c88.9.2026.08.01.09.56.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 01 Aug 2026 09:56:55 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Thierry Escande <thierry.escande@collabora.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: google: coreboot: validate table bounds
Date: Sat,  1 Aug 2026 22:41:51 +0545
Message-ID: <20260801165651.42172-1-acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing coreboot_table_populate() bounds checks limit individual
entries to the mapped length.
However, coreboot_table_probe() replaces the platform resource length with
header and table sizes supplied by firmware before mapping the full table.

A malformed table can overflow the 32-bit size addition or advertise an
extent beyond the resource, causing the driver to map and parse memory
outside the resource. A resource shorter than the fixed header is also
mapped as though it contained a complete header.

Reject resources shorter than the fixed header. After validating the
signature, require a complete header, calculate the advertised extent with
overflow checking, and reject extents beyond the resource before remapping
the table.

Fixes: d384d6f43d1e ("firmware: google memconsole: Add coreboot support")
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>

diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index e63933ff6..96e68ae3f 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -170,6 +170,7 @@ static int coreboot_table_populate(struct device *dev, void *ptr, resource_size_
 static int coreboot_table_probe(struct platform_device *pdev)
 {
 	resource_size_t len;
+	resource_size_t table_span;
 	struct coreboot_table_header *header;
 	struct resource *res;
 	struct device *dev = &pdev->dev;
@@ -181,7 +182,7 @@ static int coreboot_table_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	len = resource_size(res);
-	if (!res->start || !len)
+	if (!res->start || len < sizeof(*header))
 		return -EINVAL;
 
 	/* Check just the header first to make sure things are sane */
@@ -189,19 +190,27 @@ static int coreboot_table_probe(struct platform_device *pdev)
 	if (!header)
 		return -ENOMEM;
 
-	len = header->header_bytes + header->table_bytes;
 	ret = strncmp(header->signature, "LBIO", sizeof(header->signature));
+
+	if (!ret &&
+	    (header->header_bytes < sizeof(*header) ||
+	     check_add_overflow((resource_size_t)header->header_bytes,
+				(resource_size_t)header->table_bytes,
+				&table_span) ||
+	     table_span > len))
+		ret = -EINVAL;
+
 	memunmap(header);
 	if (ret) {
 		dev_warn(dev, "coreboot table missing or corrupt!\n");
 		return -ENODEV;
 	}
 
-	ptr = memremap(res->start, len, MEMREMAP_WB);
+	ptr = memremap(res->start, table_span, MEMREMAP_WB);
 	if (!ptr)
 		return -ENOMEM;
 
-	ret = coreboot_table_populate(dev, ptr, len);
+	ret = coreboot_table_populate(dev, ptr, table_span);
 
 	memunmap(ptr);
 
-- 
2.51.2

