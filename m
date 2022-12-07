Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C7F2F27
	for <chrome-platform@lists.linux.dev>; Wed,  7 Dec 2022 17:40:26 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id 3so5962427iou.12
        for <chrome-platform@lists.linux.dev>; Wed, 07 Dec 2022 09:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AOuwreGgWBZ48meXtIQ/os+4XBQo160kH7z5x79khw=;
        b=Dvdm7agXaDNguMbyo8u06WGXNm5xdcejs53tMqoSM1hVGgY7grIWQi8iVqYbnpaH+7
         WawsM41ZigZLSk6Z+KW1GuIaH+1xDAsRadTt7uHosDdvlL2IPXvRKnQA+XsOT9q5jSQ4
         dkJhrcv+qGK4bKW20aG9/0lcZdZUsi1kK+tCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AOuwreGgWBZ48meXtIQ/os+4XBQo160kH7z5x79khw=;
        b=p3DH7Fh5LrGn4v1tBt3kODF2q9uc3xnPpUdJDwU3ENhHeTa8GIum7zV0yAlOuCITT9
         Z90cSpRRn1uuNzk98Leaytqj8QKzi39uMDGR1iwFln+X9VYMO17NQAncRLrCSmE61Ip6
         Mmiw00PpjojBzEVAbMjArwQOznYevloDeR+oxpMenQGMFyZKgX49Wd8Nmsqk47hkuhGB
         8IIIPVx6ErilORFS6kWC8ztrlb2MdvX/f56C2I0QTixhcxkvn7WPDop5QafOHcjYcmzE
         heiJR89hEw28VXNp+kF0QNTOzqbk8idZkrYZjwcv6aSNW6PzdYkgww20aefrNwkvPAwd
         /cOg==
X-Gm-Message-State: ANoB5pmGsrkO6PvYkV9OiWPLxQAl3qVSCAFq5cpI7dZnr63uK5Nd9l1u
	jW6GguhMyYhcw3hKVbJish94N4Tt5YVIcxyB
X-Google-Smtp-Source: AA0mqf7RjJO0JDLfzyaLcRNRDdlrZ9OplkdryElY797AUvXkfvucIAxiTZco4PylZHXpRt6wtcglpg==
X-Received: by 2002:a05:6602:4145:b0:6e0:992:d816 with SMTP id bv5-20020a056602414500b006e00992d816mr7112996iob.77.1670434825527;
        Wed, 07 Dec 2022 09:40:25 -0800 (PST)
Received: from markhas1.roam.corp.google.com (63-225-246-100.hlrn.qwest.net. [63.225.246.100])
        by smtp.gmail.com with ESMTPSA id q18-20020a920512000000b0030341bffab8sm32782ile.31.2022.12.07.09.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 09:40:25 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Raul Rangel <rrangel@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH v10 3/3] platform/chrome: cros_ec_uart: Add DT enumeration support
Date: Wed,  7 Dec 2022 10:40:13 -0700
Message-Id: <20221207104005.v10.3.Ie23c217d69ff25d7354db942613f143bbc8ef891@changeid>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
In-Reply-To: <20221207104005.v10.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
References: <20221207104005.v10.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bhanu Prakash Maiya <bhanumaiya@chromium.org>

Existing firmware uses the "PRP0001" _HID and an associated compatible
string to enumerate the cros_ec_uart.

Add DT enumeration support for already shipped firmware.

Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
Co-developed-by: Mark Hasemeyer <markhas@chromium.org>
Signed-off-by: Mark Hasemeyer <markhas@chromium.org>

---

Changes in v10:
- No change

Changes in v9:
- Rebase onto for-next
- Update authorship

Changes in v8:
- No change

Changes in v7:
- Move PRP0001 enumeration support to its own commit

 drivers/platform/chrome/cros_ec_uart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/chrome/cros_ec_uart.c
index 873aee4172bfd..70e337717508a 100644
--- a/drivers/platform/chrome/cros_ec_uart.c
+++ b/drivers/platform/chrome/cros_ec_uart.c
@@ -11,6 +11,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/serdev.h>
 #include <linux/slab.h>
@@ -332,6 +333,12 @@ static int __maybe_unused cros_ec_uart_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(cros_ec_uart_pm_ops, cros_ec_uart_suspend,
 			 cros_ec_uart_resume);
 
+static const struct of_device_id cros_ec_uart_of_match[] = {
+	{ .compatible = "google,cros-ec-uart" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cros_ec_uart_of_match);
+
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id cros_ec_uart_acpi_id[] = {
 	{ "GOOG0019", 0 }
@@ -344,6 +351,7 @@ static struct serdev_device_driver cros_ec_uart_driver = {
 	.driver	= {
 		.name	= "cros-ec-uart",
 		.acpi_match_table = ACPI_PTR(cros_ec_uart_acpi_id),
+		.of_match_table = cros_ec_uart_of_match,
 		.pm	= &cros_ec_uart_pm_ops,
 	},
 	.probe		= cros_ec_uart_probe,
-- 
2.39.0.rc1.256.g54fd8350bd-goog

