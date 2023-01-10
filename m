Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6B4A94E
	for <chrome-platform@lists.linux.dev>; Tue, 10 Jan 2023 19:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673379382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Yj+HBuTUncC5lE81l2Gg3tjvcbmvnq4VCsptZAErNXM=;
	b=Wm96HrmmsROWBqHNaGpqYT6vLH73oukfcAil3LN3EZac2vugkQtojWfGh0Wme/yKVZLDZG
	U51xHMm/eueV2SaHHiWVQ9nDj8eD4BRPgus3b19PPFyJTxvsylkAeMwhTfryBzEykZzW97
	vBepv4+tOhGl/4KGMFF2l53tcPCwwqY=
Received: from mail-pj1-f70.google.com (209.85.216.70 [209.85.216.70]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-52-BeHyWQ-JNr-Fndi1IHnwvA-1; Tue,
 10 Jan 2023 14:36:21 -0500
X-MC-Unique: BeHyWQ-JNr-Fndi1IHnwvA-1
Received: by mail-pj1-f70.google.com with SMTP id o21-20020a17090aac1500b00226349b1e06so9783012pjq.4
        for <chrome-platform@lists.linux.dev>; Tue, 10 Jan 2023 11:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yj+HBuTUncC5lE81l2Gg3tjvcbmvnq4VCsptZAErNXM=;
        b=hRc6+DsMzFibz4G42iGIvMpghBl5TGNZvxJWpaNugVbXuTozAPuyQt+zwYqcohqC93
         4jcqQqN6/kaIY4dIvjevvbDO9YbDmKbtqPAwGUJn8ExHCTLhGRpLe5iL+MhP6C0vnsHq
         Zt+ptoJblYUAKXL8qrTSL00kWhszqq1nF8chaKvaOfpGLIds8QsKsrdAEFHOfep6zLHJ
         DkKygXw81lZMSnfmJ3ArV4+qAlXib3mj2WkupZwvO93Y3/xJQphhmjEZztHC0kiHk5Pb
         XL17DfkO4X9iV4yLwhrdJhwP/1iAE137Ih+46JHvdc/iVtCEURP+1sAvKmCpNiu5SmST
         RWNQ==
X-Gm-Message-State: AFqh2koG0JUcTtbtZ3VmLlUHZ5HGxgPF/lv92Z2YR62K/JZ8mhl665yz
	ikdp/7U4mCbxuvb565nHjK0awFUOOve1ERaMpT6/e9dT9nnCTmNA6I1+y+oDm4WVhu+rnVPG+Ez
	AePQkvkUSD0cjH64B5T1wTUvLxgO0
X-Received: by 2002:a05:6a20:47c8:b0:9d:efbe:204b with SMTP id ey8-20020a056a2047c800b0009defbe204bmr76827477pzb.1.1673379380026;
        Tue, 10 Jan 2023 11:36:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvCtPTYrYlOZy/4MsymT5iev0oOLVLTuxBLZWISSRSnYz9AF4e8Uu0T/HgOGW4RT0ynfsSHjQ==
X-Received: by 2002:a05:6a20:47c8:b0:9d:efbe:204b with SMTP id ey8-20020a056a2047c800b0009defbe204bmr76827465pzb.1.1673379379776;
        Tue, 10 Jan 2023 11:36:19 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 14-20020a630c4e000000b00478f87eaa44sm7005552pgm.35.2023.01.10.11.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 11:36:19 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: bleung@chromium.org,
	groeck@chromium.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] platform/chrome: cros_ec_lpc: initialize the buf variable
Date: Tue, 10 Jan 2023 14:36:11 -0500
Message-Id: <20230110193611.3573777-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Clang static analysis reports this problem
drivers/platform/chrome/cros_ec_lpc.c:379:13: warning: The left operand
  of '!=' is a garbage value [core.UndefinedBinaryOperatorResult]
    if (buf[0] != 'E' || buf[1] != 'C') {
         ~~~~~~ ^

The check depends on the side effect of the read.  When the read fails
or is short, a buf containing garbage could be mistaken as correct.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/platform/chrome/cros_ec_lpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 3708fa75feb1..68bba0fcafab 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -350,7 +350,7 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	struct acpi_device *adev;
 	acpi_status status;
 	struct cros_ec_device *ec_dev;
-	u8 buf[2];
+	u8 buf[2] = {};
 	int irq, ret;
 
 	/*
-- 
2.27.0

