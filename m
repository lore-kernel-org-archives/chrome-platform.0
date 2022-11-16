Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064A1D51B
	for <chrome-platform@lists.linux.dev>; Wed, 16 Nov 2022 18:23:50 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso2271387wme.5
        for <chrome-platform@lists.linux.dev>; Wed, 16 Nov 2022 10:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yQjjMAQrrpASdD1L3n0QEFScybOlfh9l9bOTXc5TLUI=;
        b=AHSsEKDCZzvtWJkmy8woQvs6bKRrig5EHuBKPrPN0ravNbsiSOcvwPNFe06SPbtfJN
         /Z7AIjraaP+wrM7JKqUsWWT5HEPSWnJZz6AEXGuMn2wwyyV3n+NZxpWD3//N+OWv01E9
         NRhi317R3jfdOlBZTpvD9k0Pzljwk9WsBEzFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQjjMAQrrpASdD1L3n0QEFScybOlfh9l9bOTXc5TLUI=;
        b=q3ygYU3jnVNZga+YbYrQRFPZsyjE3fjPWd744KHp/8BMUYecu/ZxL4Tyakgrr4BRYE
         zM0syHTEJm7aFpbb6JptKkYe7UAFh2/r/kWFTm8KwBJXzFC6dZSNNMaBlJsJ+C3rU76K
         nsg0TrVI73bq/WN513YNgISQKwbOBrr7bjl9GUmWZbnwIXMRdOZ/0cAmPxmwMQf4TTPZ
         ceMA2RkdLWcMBHQE3SkuoHqmb25UaRr6HTDEneP5ErU5Ndiga2W78VMzIgl2rMkTxPhd
         Lcm4Y3ZEyp+tsog+NZPsM/VjWaNkWv3L4n4D01F9gAwfqbiD3zFS8OMG4+v4LZQKEsC4
         Jw5A==
X-Gm-Message-State: ANoB5plSrtyVNj08/q1avnxUYKctq+YRUsYTwhsfoQ81IMh2xcBr11vG
	arX1Cz7rJ1BdBLFDuKXobXUPey2Cl9/85dyoSObd4Q==
X-Google-Smtp-Source: AA0mqf6PREhIqQFRTNwmNtN/1+ZAnN20ckUWwjWs3PeprIKnB+yvmUJX+i1K9IgGzYG3vHJlOXS1R/LeGk2IBSqBZmY=
X-Received: by 2002:a05:600c:601f:b0:3c6:e369:e856 with SMTP id
 az31-20020a05600c601f00b003c6e369e856mr3032899wmb.35.1668623029281; Wed, 16
 Nov 2022 10:23:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210804213139.4139492-1-gwendal@chromium.org>
 <20210804213139.4139492-2-gwendal@chromium.org> <CAPUE2usQX_uQewpCYOs3SRUo7vDDMfg=n7idNvCgThDHMqTf7w@mail.gmail.com>
In-Reply-To: <CAPUE2usQX_uQewpCYOs3SRUo7vDDMfg=n7idNvCgThDHMqTf7w@mail.gmail.com>
From: Gwendal Grignou <gwendal@chromium.org>
Date: Wed, 16 Nov 2022 10:23:38 -0800
Message-ID: <CAPUE2uuj1qde16QWHb=0+yMW3ERhXzV7ehGcViWCfij7ADeyWg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] platform/chrome: Poke kb_wake_angle attribute
 visibility when needed
To: dtor@chromium.org, jwerner@chromium.org, bleung@chromium.org, 
	enric.balletbo@collabora.com, groeck@chromium.org
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

[+chrome-platform@lists.linux.dev]

On Mon, Nov 14, 2022 at 8:10 PM Gwendal Grignou <gwendal@chromium.org> wrote:
>
> This patch is still needed to get the attribute to be present on most machines.
> Putting the attribute in the sensor hub device is more complicated, as
> that device is not as easily findable as `cros_ec`, present in
> `/sys/class`.
>
> Gwendal.
>
> On Wed, Aug 4, 2021 at 2:31 PM Gwendal Grignou <gwendal@chromium.org> wrote:
> >
> > When the sensorhub detects 2 accelerometers, kb_wake_angle attribute
> > in the chromeos EC class device needs to be visible.
> > When detected, the sensorhub requests the class device to
> > revisit the visibility of the kb_wake_angle attribute.
> > Expose the attribute group to alter to close a potiential race between
> > cros-ec-sensorhub and cros-ec-sysfs (that creates the attribute group
> > on behalf of the class driver).
> >
> > Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
> > ---
> >  drivers/platform/chrome/cros_ec_sensorhub.c | 6 +++++-
> >  drivers/platform/chrome/cros_ec_sysfs.c     | 5 +++--
> >  include/linux/platform_data/cros_ec_proto.h | 2 ++
> >  3 files changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/platform/chrome/cros_ec_sensorhub.c b/drivers/platform/chrome/cros_ec_sensorhub.c
> > index 9c4af76a9956e..8f24ed90b229c 100644
> > --- a/drivers/platform/chrome/cros_ec_sensorhub.c
> > +++ b/drivers/platform/chrome/cros_ec_sensorhub.c
> > @@ -106,8 +106,12 @@ static int cros_ec_sensorhub_register(struct device *dev,
> >                 sensor_type[sensorhub->resp->info.type]++;
> >         }
> >
> > -       if (sensor_type[MOTIONSENSE_TYPE_ACCEL] >= 2)
> > +       if (sensor_type[MOTIONSENSE_TYPE_ACCEL] >= 2) {
> >                 ec->has_kb_wake_angle = true;
> > +               if (ec->group && sysfs_update_group(&ec->class_dev.kobj,
> > +                                                   ec->group))
> > +                       dev_warn(dev, "Unable to update cros-ec-sysfs");
> > +       }
> >
> >         if (cros_ec_check_features(ec,
> >                                    EC_FEATURE_REFINED_TABLET_MODE_HYSTERESIS)) {
> > diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platform/chrome/cros_ec_sysfs.c
> > index f07eabcf9494c..17fe657f3ffd5 100644
> > --- a/drivers/platform/chrome/cros_ec_sysfs.c
> > +++ b/drivers/platform/chrome/cros_ec_sysfs.c
> > @@ -341,7 +341,8 @@ static int cros_ec_sysfs_probe(struct platform_device *pd)
> >         struct device *dev = &pd->dev;
> >         int ret;
> >
> > -       ret = sysfs_create_group(&ec_dev->class_dev.kobj, &cros_ec_attr_group);
> > +       ec_dev->group = &cros_ec_attr_group;
> > +       ret = sysfs_create_group(&ec_dev->class_dev.kobj, ec_dev->group);
> >         if (ret < 0)
> >                 dev_err(dev, "failed to create attributes. err=%d\n", ret);
> >
> > @@ -352,7 +353,7 @@ static int cros_ec_sysfs_remove(struct platform_device *pd)
> >  {
> >         struct cros_ec_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
> >
> > -       sysfs_remove_group(&ec_dev->class_dev.kobj, &cros_ec_attr_group);
> > +       sysfs_remove_group(&ec_dev->class_dev.kobj, ec_dev->group);
> >
> >         return 0;
> >  }
> > diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
> > index 02599687770c5..c6dca260bbd5d 100644
> > --- a/include/linux/platform_data/cros_ec_proto.h
> > +++ b/include/linux/platform_data/cros_ec_proto.h
> > @@ -191,6 +191,7 @@ struct cros_ec_platform {
> >  /**
> >   * struct cros_ec_dev - ChromeOS EC device entry point.
> >   * @class_dev: Device structure used in sysfs.
> > + * @groups: sysfs attributes groups for this EC.
> >   * @ec_dev: cros_ec_device structure to talk to the physical device.
> >   * @dev: Pointer to the platform device.
> >   * @debug_info: cros_ec_debugfs structure for debugging information.
> > @@ -200,6 +201,7 @@ struct cros_ec_platform {
> >   */
> >  struct cros_ec_dev {
> >         struct device class_dev;
> > +       const struct attribute_group *group;
> >         struct cros_ec_device *ec_dev;
> >         struct device *dev;
> >         struct cros_ec_debugfs *debug_info;
> > --
> > 2.32.0.554.ge1b32706d8-goog
> >
