Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C616E469B
	for <chrome-platform@lists.linux.dev>; Tue, 14 Jun 2022 06:49:12 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id e5so4115614wma.0
        for <chrome-platform@lists.linux.dev>; Mon, 13 Jun 2022 23:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rK2JBezORIHT404/AnKcTtSy2/jIHZfS+t0GGJ0+ABY=;
        b=WcIWyHKlRAS26Z8EoLw6XLKzEPXqlPumRldCWWOKPHE60ySBl3cfry6pTEZK8vrxSX
         KEq8iqRSaZUDNgr0sf6uYKhyNaMpdp1d1ALsC2BHLxW+R/p1sLkmlZiG2jTgKWnC6r6M
         wm2CAj+7ewzCvE8yvadPNbiyAYROdGt8+Ccw4jXeewwH2rAdRtbOZ8+l/ryvDupbkgq+
         C0dFBq+ehpIgGJgrf8sAAmy0CLNnoFphd+vN4PKFJsStzMdThDPse7VRf7I036178AIn
         6lby+hWvwbDnQA+hoUlmYub2T329n1TcmdFDFnRJs+V2oSFLDJZxtT/2CK4Dwb+T/8tC
         9tMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rK2JBezORIHT404/AnKcTtSy2/jIHZfS+t0GGJ0+ABY=;
        b=7MQBJ9CMZQHGO0SIYeG4bxL2NQNFKMuhj9Wo+GjlowBi07049wrSYuWCsgGg8VnzL9
         JaiChezUxFZ+NnGVNoT/NnmDRaYNU6PKipHiiQ9lCOAHxSjVxHb2tI5LiJrarRudAist
         fxCnSBIjcsYOrjhSa19EVifX48g8q019PqBqKsf958r3qOhehdLckZjAdIxwlvLIymSR
         0wGhsgNuKyQ14sXiL0RWCn7a1tWgS6ZgEZM9BoGMuluwIN1UMBqZhAylWjqnep9Y65yM
         2iKKO1A9iQVklhz9YUB4dLmxKfeLb/mszc2Jw3i0FKaowr6flwdux8MG66JgaYs6fOqG
         cOmg==
X-Gm-Message-State: AOAM530T7bz0A/7RRpdox2s5P3QYWPuia/R0Q4fItECuwyYcbBQBH1WK
	Syxhyhr5mlUWCN3t5bifsJ0=
X-Google-Smtp-Source: ABdhPJxKDEf3IT/FOvko39kZHApTNB9iNglrdPDScj/yimRsC18KrDoK3lWb1n7NeK9351mDqeOwVg==
X-Received: by 2002:a05:600c:6020:b0:39c:96ec:5014 with SMTP id az32-20020a05600c602000b0039c96ec5014mr2426943wmb.57.1655189351116;
        Mon, 13 Jun 2022 23:49:11 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id bg23-20020a05600c3c9700b0039c15861001sm18549655wmb.21.2022.06.13.23.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 23:49:10 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] platform/chrome: Fix spelling mistake "unknwon" -> "unknown"
Date: Tue, 14 Jun 2022 07:49:09 +0100
Message-Id: <20220614064909.47804-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/platform/chrome/cros_ec_proto.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 1bd567244f8e..6923ea4401e5 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -346,7 +346,7 @@ static int cros_ec_get_proto_info(struct cros_ec_device *ec_dev, int devidx)
 		dev_dbg(ec_dev->dev, "found PD chip\n");
 		break;
 	default:
-		dev_dbg(ec_dev->dev, "unknwon passthru index: %d\n", devidx);
+		dev_dbg(ec_dev->dev, "unknown passthru index: %d\n", devidx);
 		break;
 	}
 
-- 
2.35.3

