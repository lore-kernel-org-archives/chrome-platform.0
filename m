Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794077595;
	b=tRnWBB2nPvhZmFjr8edziimmIYVb90ZBoZEYYUqSHNx/utb2rbdarzEy4E3wrIhDeNUd
	 8e2TmJz2h5cZtqIEt2AnFg/U/tR+bMLrvsErJE0P6LiFC+JdwwRW7kN4r8MJqQGkWhah3
	 NoOpRd9GPI5W3oIFXx5diuFeBoJ9O1DcNj2BAAD3hSLCRf+xliXWUvZtN10V82cYY0pMS
	 d6FBEcyTmQ/WYoZyQq6op1BHLa+z4wSz0vBIWynMhu59umy+wncczPVKgnRB2NxqJi//Z
	 TJRzsMo5g5XsbsbPWG5vAYNwVrmjC5iHC9FV1u6OYG5Rebuggik3w1rYuD4wUKKumwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794077595;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mpuXwX6IFnkdegkUlA97fOC6qpNPmlKXOVIIkTl/gEg=;
	b=43WlTUT+FiMArUVFgQVQFHdBj03kgjHG1KH3PCvVx3/vS8HTelWqz7VAuojb9ttw2QCy
	 DZgRXtHsEyP6B8qf75k2z3Btbt5Qfh1CbhO/ltX6TIld3cIfU7KlQm68xaM8RBTIn+tq8
	 607/2sPF+ubGtQNpMQe9sT/uadwm2QzhgFtz6lrWW943RL112Fz0yipCoEBRdgtgtERY4
	 SKq7qc0U8t7jPjXBWOzmEpyUznN2E/IHiEjYAVJqKZYcJFUngbTOfjL6UA7igFdkQl91h
	 1oYQBHF/jT6xfWpkUnKAWSoD9Q5B5vvuy2tueNPFczZuKK+fW9kBWEdfNiA4xg8WBVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	arc=none smtp.remote-ip=79.135.106.26
Received: from mail-10626.protonmail.ch (mail-10626.protonmail.ch [79.135.106.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58994606A32D
	for <chrome-platform@lists.linux.dev>; Sat,  7 Nov 2026 18:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58994606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1794077590; x=1794336790;
	bh=mpuXwX6IFnkdegkUlA97fOC6qpNPmlKXOVIIkTl/gEg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=iWO9Q5jZVSpA/SSupoAqlUhAFh6I2FZz4f1D7NcNhs5ScYqwe5a1LDe4+n4z/A7m8
	 ttD4bkmNli7LC1C8mKC7jSDwhOhhYL5HKoabd0oXsbOHWOsLVzNDC8GHrlvygU+EBm
	 DWMBxbaV54yFfdXlXGd8V2r+o3TD26GbsZx6bNS+aORBYvuOvYG5oJBhTTwRc9GWLk
	 ZmDQSnK1RqKibSaJBV/qq2POamdLYEIQYjDKYyZAR5FYNlLSrCtttzCJJyMR+H+RGI
	 glAKz5JLwPs9UVZuYIFmQ7o4n/idNpi9n4D7lHVm/I70JI0fg2mp7aW+nt7lpJvh2C
	 pESdWZyP0JrHw==
Date: Sat, 07 Nov 2026 18:53:05 +0000
To: Dan Callaghan <dcallagh@chromium.org>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
From: Chad Aldreda <ca@modelmiser.com>
Cc: =?utf-8?Q?Sami_Ky=C3=B6stil=C3=A4?= <skyostil@chromium.org>, chrome-platform@lists.linux.dev, stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] platform/chrome: cros_hps_i2c: hold the client device for an open file
Message-ID: <20261107185258.4115770-2-ca@modelmiser.com>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: 9dca39c3f44b982a681d6c5262ddf6b142fd459c
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

hps_release() finds struct hps_drvdata through file->private_data and
calls pm_runtime_put() on hps->client->dev. hps comes from
devm_kzalloc(), so it is freed when the driver is unbound, and a later
close() of a file opened before the unbind reads freed memory. If the
client was removed with delete_device, the i2c_client may have been
freed as well, and pm_runtime_put() runs on it. KASAN reports a
slab-use-after-free in hps_release() and, after delete_device, further
ones in the runtime PM code.

release() needs only the client device, so take a reference to it in
open() and keep it in file->private_data, and leave hps alone in
release(). hps is still valid in open(): misc_open() calls it with
misc_mtx held, and hps_i2c_remove() calls misc_deregister(), which takes
misc_mtx, before devres frees hps. Unless the driver has been bound
again, runtime PM on the device is disabled by the time such a release()
runs, so pm_runtime_put() drops the usage count and its idle request
fails with -EACCES.

Fixes: 5f9952548d91 ("platform/chrome: add a driver for HPS")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Chad Aldreda <ca@modelmiser.com>
---
Found with the coccinelle script posted at
https://lore.kernel.org/r/20261106193517.3267013-2-ca@modelmiser.com

Reproduced in QEMU 10.2.4 (q35, KASAN). The driver binds to a client
created with new_device on the i801 SMBus adapter, with the "enable"
GPIO supplied by gpio-mockup through a test-only lookup module. A
process opens /dev/cros-hps, the client is unbound or deleted through
sysfs, and the process then closes the file. Without this patch KASAN
reports one use-after-free after an unbind and six after delete_device;
with it there are none, and an unbind followed by a bind works. Not
tested on HPS hardware. Unbinding or deleting the client needs root.

Unchanged by this patch: if the driver is bound again while a file
opened before the unbind is still open, that file's pm_runtime_put()
lands on the new instance's usage count, so the sensor stays powered
until the old file is closed. The counts measured the same with and
without the patch (2, then 1, then 0); before it, that put went through
freed memory.

For stable: before v7.0, hps_release() ends in
"return pm_runtime_put(dev);". There it should end:

=09pm_runtime_put(dev);
=09put_device(dev);

=09return 0;

This is independent of the revocable work for cros_ec_chardev; it only
stops release() from using the driver data.

 drivers/platform/chrome/cros_hps_i2c.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_hps_i2c.c b/drivers/platform/chro=
me/cros_hps_i2c.c
index 3b9485627831..290b136ce4fa 100644
--- a/drivers/platform/chrome/cros_hps_i2c.c
+++ b/drivers/platform/chrome/cros_hps_i2c.c
@@ -36,17 +36,26 @@ static int hps_open(struct inode *inode, struct file *f=
ile)
 =09struct hps_drvdata *hps =3D container_of(file->private_data,
 =09=09=09=09=09       struct hps_drvdata, misc_device);
 =09struct device *dev =3D &hps->client->dev;
+=09int ret;
+
+=09ret =3D pm_runtime_resume_and_get(dev);
+=09if (ret)
+=09=09return ret;
=20
-=09return pm_runtime_resume_and_get(dev);
+=09/*
+=09 * hps is freed when the driver is unbound, which can happen before
+=09 * release(), so release() uses only the device, held here.
+=09 */
+=09file->private_data =3D get_device(dev);
+=09return 0;
 }
=20
 static int hps_release(struct inode *inode, struct file *file)
 {
-=09struct hps_drvdata *hps =3D container_of(file->private_data,
-=09=09=09=09=09       struct hps_drvdata, misc_device);
-=09struct device *dev =3D &hps->client->dev;
+=09struct device *dev =3D file->private_data;
=20
 =09pm_runtime_put(dev);
+=09put_device(dev);
=20
 =09return 0;
 }
--=20
2.43.0


