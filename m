Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46BF1363
	for <chrome-platform@lists.linux.dev>; Wed, 26 Jul 2023 07:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3EFC433C8;
	Wed, 26 Jul 2023 07:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690356717;
	bh=SUbOM999Uc0B76uVh1puAMXDYYs/uWvWSNUW07pJoGs=;
	h=From:To:Cc:Subject:Date:From;
	b=IisGyywgEhLZGeIlv/FAWbEEiwicQEEm3j7eTmjj0OyrelyEwpihDSlDFr779Vk0S
	 AwCZpCFWaOQLGlSnnZY2Wf2pcPmAnTBaLpmv9HPkVheTFaYCRKqLpvAuGRQ23vhBXi
	 Od6sqvrAaO/8OTha5zdb2DvbMViQ/6zeTGJe04iaV9FZhAFcUu3tvAh5HtX/ZCezbS
	 nobeBUmW2IjFG/IV3aPo63hXwwHFCctObMR9KjY5CM4nzgP9Yn+38c69nZxE05vcy9
	 ERL40p89XCVfSVqw6fY/cISzF2wC1GMlwe5C+ady275aBq5LfjzBSNXl9eaeG7oFyB
	 BR/xqGxJNGIwA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com,
	tzungbi@kernel.org
Subject: [PATCH] platform/chrome: chromeos_acpi: print hex string for ACPI_TYPE_BUFFER
Date: Wed, 26 Jul 2023 15:31:27 +0800
Message-ID: <20230726073127.2969387-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`element->buffer.pointer` should be binary blob.  `%s` doesn't work perfect
for them.

Print hex string for ACPI_TYPE_BUFFER.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/chromeos_acpi.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/chromeos_acpi.c b/drivers/platform/chrome/chromeos_acpi.c
index 50d8a4d4352d..a60d344c54e4 100644
--- a/drivers/platform/chrome/chromeos_acpi.c
+++ b/drivers/platform/chrome/chromeos_acpi.c
@@ -90,7 +90,25 @@ static int chromeos_acpi_handle_package(struct device *dev, union acpi_object *o
 	case ACPI_TYPE_STRING:
 		return sysfs_emit(buf, "%s\n", element->string.pointer);
 	case ACPI_TYPE_BUFFER:
-		return sysfs_emit(buf, "%s\n", element->buffer.pointer);
+		{
+			int i, n;
+			const int char_per_line = 16;
+
+			for (i = 0, n = 0; i < element->buffer.length; ++i) {
+				n += sysfs_emit_at(buf, n, " %2.2x", element->buffer.pointer[i]);
+
+				if (((i + 1) % char_per_line) == 0)
+					n += sysfs_emit_at(buf, n, "\n");
+			}
+			n += sysfs_emit_at(buf, n, "\n");
+
+			if (n == PAGE_SIZE - 1) {
+				dev_info(dev, "truncating sysfs content for %s\n", name);
+				sysfs_emit_at(buf, n - 3, "..\n");
+			}
+
+			return n;
+		}
 	default:
 		dev_err(dev, "element type %d not supported\n", element->type);
 		return -EINVAL;
-- 
2.41.0.487.g6d72f3e995-goog

