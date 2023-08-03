Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CDD7F
	for <chrome-platform@lists.linux.dev>; Thu,  3 Aug 2023 01:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51133C433C8;
	Thu,  3 Aug 2023 01:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691025172;
	bh=+mieHhAMb+UOumo7tvkM3w4MpZEGhiqsq1dbb9UpaR8=;
	h=From:To:Cc:Subject:Date:From;
	b=XdiqwiDHmdgRvIqq+LaRvFR3v+QFX+0lu9W3iROnzHck7fCYgj1+1vZYYKPdpDxwd
	 akulzT+l/77evjO2PHZukR74bObFjuATTky9CCUCFMkIabxsAit80jMxLK6iEJVzgh
	 kGebStmLYYvlO3gowzfrRzb15K/v930NuCHE2Xz/0RumSxrj6X2Rf8dQbbdoTy05UE
	 gVkGTztGjnuEZcIBAgzczBxO39E0iI5JzKroomdQ9cOCjkl/vlp7YVn8tSTnu56QUi
	 k7JfmDW4jVDS/p/+MNQyW1FKNblu7Nh8bcu5r7IEuRcPrDadLkNm1w+ZtuRlSBk/f8
	 7GxBmb7uaXWxg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com,
	usama.anjum@collabora.com,
	tzungbi@kernel.org,
	briannorris@chromium.org
Subject: [PATCH v3] platform/chrome: chromeos_acpi: print hex string for ACPI_TYPE_BUFFER
Date: Thu,  3 Aug 2023 09:12:45 +0800
Message-ID: <20230803011245.3773756-1-tzungbi@kernel.org>
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

Print hex string for ACPI_TYPE_BUFFER.  Also update the documentation
to reflect this.

Fixes: 0a4cad9c11ad ("platform/chrome: Add ChromeOS ACPI device driver")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v2[1]:
- Use dev_info_once() instead of dev_info().
- Update documentation.
- Add Fixes tag.

Changes from v1[2]:
- Use hex_dump_to_buffer().
- Rewrite the loop for catching edge cases for truncating.

[1]: https://patchwork.kernel.org/project/chrome-platform/patch/20230802095736.3079963-1-tzungbi@kernel.org/
[2]: https://patchwork.kernel.org/project/chrome-platform/patch/20230726073127.2969387-1-tzungbi@kernel.org/

 .../ABI/testing/sysfs-driver-chromeos-acpi    |  2 +-
 drivers/platform/chrome/chromeos_acpi.c       | 31 ++++++++++++++++++-
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-chromeos-acpi b/Documentation/ABI/testing/sysfs-driver-chromeos-acpi
index c308926e1568..7c8e129fc100 100644
--- a/Documentation/ABI/testing/sysfs-driver-chromeos-acpi
+++ b/Documentation/ABI/testing/sysfs-driver-chromeos-acpi
@@ -134,4 +134,4 @@ KernelVersion:	5.19
 Description:
 		Returns the verified boot data block shared between the
 		firmware verification step and the kernel verification step
-		(binary).
+		(hex dump).
diff --git a/drivers/platform/chrome/chromeos_acpi.c b/drivers/platform/chrome/chromeos_acpi.c
index 50d8a4d4352d..1312aaaa8750 100644
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
+			dev_info_once(dev, "truncating sysfs content for %s\n", name);
+			sysfs_emit_at(buf, PAGE_SIZE - 4, "..\n");
+			return PAGE_SIZE - 1;
+		}
 	default:
 		dev_err(dev, "element type %d not supported\n", element->type);
 		return -EINVAL;
-- 
2.41.0.585.gd2178a4bd4-goog

