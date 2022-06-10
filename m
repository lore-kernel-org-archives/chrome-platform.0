Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9E77A
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 13:33:58 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id hv24-20020a17090ae41800b001e33eebdb5dso3672807pjb.0
        for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 06:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=um0IS2eKOXRyYR/yA6NtlR2RuwKLd8iOPkZZFVQUfaM=;
        b=FQbpSrMJTWpI8nqmrsO+Sec+vPS5Efs8FtRadI64A+uAMDrpDW+pbqzN9H1tNyFs2D
         wOPnX+Ci643o95mNRMfDFTxoGly/EJ+jbgXT6N4wY5HA96D4ihfIihdub7W+rxRwdtRP
         eOBvG2ku6Uql7GZJqLzUHGbcnNR4ZZFVOPDudec4RWf5XjC295Cu0MLAA6UtOZ7d86xd
         DW7zPpCPkPz+BwdEnqWos/P78ifD4UDp+oI45U+N8YNYUhiVEQAv6D9aNynbNNUJGecm
         QG/KKNxHRqS1C1slpMtdWc7Fb2XR94357epPIq7eLgypsraHTg+uhTh82GcPgUig8K+p
         NI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=um0IS2eKOXRyYR/yA6NtlR2RuwKLd8iOPkZZFVQUfaM=;
        b=cSmItUNwS4ZzaytIHep10ZzW+mkjBUlosAZDLAfkXda+SOOsIQSV0TzKWr8/Xnn5KK
         ga7mV8SZfjhuUejJVNKcHgtIWXLQ9KJ/tu7AP43L0hIBV9oVVfO+S534WP14Wmwc5Vtz
         OAi2siSkSgspkgVQbWMEriNt3PdOuuXD3/vyOaMbxn4zfvXaz5aacwHK/HGOJEEhWFc/
         Y7fa7JGFYwCC1kc7j73ScnURszuKBEFKJU6yWCKH99hTky10sz+ALDNMxGvqHoQIWq6Q
         awuFXSuuuL+vyDKA6WC8viNHeP+lwAvG1A0a/l4jVSVYHyaEX/qwXjQUb0YJjoO5Y1xS
         n03w==
X-Gm-Message-State: AOAM532rzLpb64bbHnsIurPdKzwpFu8z2QAf8J14vE8XOC+NzUZAcjAN
	+iIcb9hCOMAjQhrbF3aH1pbQ0Q==
X-Google-Smtp-Source: ABdhPJzlRIs8tVPUUVg1B3zLmotdyQPA6QoXYMdybgW5NXwJjFAaFPUifeAtxvCQb/WyAsOMYmTvgA==
X-Received: by 2002:a17:902:ec92:b0:166:3502:ecb1 with SMTP id x18-20020a170902ec9200b001663502ecb1mr45048576plg.62.1654868038099;
        Fri, 10 Jun 2022 06:33:58 -0700 (PDT)
Received: from localhost.localdomain (118-167-232-112.dynamic-ip.hinet.net. [118.167.232.112])
        by smtp.gmail.com with ESMTPSA id y192-20020a638ac9000000b003fd696ea0c8sm13121103pgd.67.2022.06.10.06.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 06:33:56 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Zhuohao Lee <zhuohao@chromium.org>,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v1] media: platform: cros-ec: Add kinox to the match table
Date: Fri, 10 Jun 2022 21:33:42 +0800
Message-Id: <20220610133342.3735012-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Kinox device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 8c8d8fc5e63e..093aa4fc6692 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -217,6 +217,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Fizz", "0000:00:02.0", "Port B" },
 	/* Google Brask */
 	{ "Google", "Brask", "0000:00:02.0", "Port B" },
+	/* Google Kinox */
+	{ "Google", "Kinox", "0000:00:02.0", "Port B" },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.25.1

