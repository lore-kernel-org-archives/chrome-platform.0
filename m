Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5995A63B6
	for <chrome-platform@lists.linux.dev>; Wed,  2 Aug 2023 09:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE19C433C9;
	Wed,  2 Aug 2023 09:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690970330;
	bh=F2iLnhE3MmvuE3fA4c0kUgCMNwhpjxPnKh8cQG7nm+A=;
	h=From:To:Cc:Subject:Date:From;
	b=jk6Vhy/pTeApYnV12rnilezWbCsI5NjCfwXP+C4HXPaDDoRHzJm0W9jLX03BnKHAp
	 zUQbfE0AhriSSaUllMwHooH8gpvw7cpCq3NDY8BemfLdxtzXNuJd2nc6lvhXmRubpl
	 JikHbZ9jW+aRb1cCDimjCk03+4ha/EGyEOWf/rQZKCsoDahXQRUklBMF4LZrB1olm+
	 NtNH8g0RWcA+IDgHJsK9yX/1KWQdMCDD9sQxt4GY/ScSabtWBlBWrK+caCdVZWdGyM
	 rPG9iuN2bj3OZxgIkprLkJR+FMX3JaFguR2BbHR4OZz1A2g7MjF8EQy0VKVIbQUa9I
	 8c9eCdJ1/yfZg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com,
	usama.anjum@collabora.com,
	briannorris@chromium.org
Subject: [PATCH v2] platform/chrome: chromeos_acpi: print hex string for ACPI_TYPE_BUFFER
Date: Wed,  2 Aug 2023 17:57:36 +0800
Message-ID: <20230802095736.3079963-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`element->buffer.pointer` should be binary blob.  `%s` doesn't work
perfect for them.

Print hex string for ACPI_TYPE_BUFFER.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v1[1]:
- Use hex_dump_to_buffer().
- Rewrite the loop for catching edge cases for truncating.

[1]: https://patchwork.kernel.org/project/chrome-platform/patch/20230726073127.2969387-1-tzungbi@kernel.org/

 drivers/platform/chrome/chromeos_acpi.c | 31 ++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/chromeos_acpi.c b/drivers/platform/chrome/chromeos_acpi.c
index 50d8a4d4352d..761506d307ad 100644
--- a/drivers/platform/chrome/chromeos_acpi.c
+++ b/drivers/platform/chrome/chromeos_acpi.c
@@ -90,7 +90,36 @@ static int chromeos_acpi_handle_package(struct device *dev, union acpi_object *o
 	case ACPI_TYPE_STRING:
 		return sysfs_emit(buf, "%s\n", element->string.pointer);
 	case ACPI_TYPE_BUFFER:
-		return sysfs_emit(buf, "%s\n", element->buffer.pointer);
+		{
+			int i, r, at, room_left;
+			const int byte_per_line = 16;
+
+			at = 0;
+			room_left = PAGE_SIZE - 1;
+			for (i = 0; i < element->buffer.length && room_left; i += byte_per_line) {
+				r = hex_dump_to_buffer(element->buffer.pointer + i,
+						       element->buffer.length - i,
+						       byte_per_line, 1, buf + at, room_left,
+						       false);
+				if (r > room_left)
+					goto truncating;
+				at += r;
+				room_left -= r;
+
+				r = sysfs_emit_at(buf, at, "\n");
+				if (!r)
+					goto truncating;
+				at += r;
+				room_left -= r;
+			}
+
+			buf[at] = 0;
+			return at;
+truncating:
+			dev_info(dev, "truncating sysfs content for %s\n", name);
+			sysfs_emit_at(buf, PAGE_SIZE - 4, "..\n");
+			return PAGE_SIZE - 1;
+		}
 	default:
 		dev_err(dev, "element type %d not supported\n", element->type);
 		return -EINVAL;
-- 
2.41.0.585.gd2178a4bd4-goog

