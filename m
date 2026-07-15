Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A36C429023
	for <chrome-platform@lists.linux.dev>; Wed, 15 Jul 2026 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107711; cv=none; b=B3BOxogrNRMjdO9zZ3EtfDrH7do5mySWp30nFUhj7wZk2c5TUnw39sKJvVbmTTyj8UgvEBDjHIKaQ+GKW40bNcxql6MHi7bci5AfWuYBW5IakqVPiqvCxWGqGawK346X25w0W788gD3uN0TxU6VHzhkE0fP/dhCXMj7eGdo/qOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107711; c=relaxed/simple;
	bh=htcjwD/LMIrdQfPvpuiLkmT3wROgRlPIRvZLCSxScIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhFEFLiQTievj2AvwcwoJMhFUGB3aRxKyVfGhL9JsRkxigZveldYRXxUYjZklbmz4dCAuL+YYz1kI3uylEy5/F4l6uj/bvTGGeJOZvqqPB2MBAz3Z4hIpf9JxKxon6EDUFHS4semArx8YX1HKOhVypSA2Ns30G417XjtD0DXoKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdA7x4YO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdA7x4YO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E970D1F000E9;
	Wed, 15 Jul 2026 09:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784107704;
	bh=N3XeTpa34B2fIjEqLOCZwAORAaG9kwmo7twkL9/0QY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OdA7x4YOuXQMcDj3jdNn+Ix9W3jQ+S10266YtRAQllTW0OXSOteqhDI57g8eAKqF8
	 Hh/8znNZ5leH8D1fxTgVivuF+8bRVn8T0o43078gyIE3Ixr0wxehfHU8v+y52zkC5E
	 6LFLk0rSiwD56isJsszrl/u6AfjRsJ5qVzBlnvt5aINIMt6h4Bqjw+3f0I6muhAJmK
	 kUpFEbVy72GJ7dCMskmLYHsxXcaf6BrlbPwa5bMPnPEy8BaedvWNsdYFnfQcqKpqEO
	 i5W0AgbS9PUcQEyumCt+mT64NdeynLK+79+CbxCfqKLG+TkIe6p4rUOq4XPiTyW2xA
	 c1u7bxSKGNk5g==
Date: Wed, 15 Jul 2026 09:28:21 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Benson Leung <bleung@chromium.org>,
	Bryam Vargas <hexlabsecurity@proton.me>,
	chrome-platform@lists.linux.dev, suleiman@chromium.org
Subject: Re: [PATCH v2] platform/chrome: sensorhub: Fix dropped timestamp
 events and log spam
Message-ID: <aldStRgbO_1ZhScD@google.com>
References: <20260715024454.4127571-1-tzungbi@kernel.org>
 <CAAFQd5D5C+TSro3Up3rU-wAmbEnQ0+Vkj6wNCDZUZvcnCNG2aA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5D5C+TSro3Up3rU-wAmbEnQ0+Vkj6wNCDZUZvcnCNG2aA@mail.gmail.com>

On Wed, Jul 15, 2026 at 04:15:22PM +0900, Tomasz Figa wrote:
> On Wed, Jul 15, 2026 at 11:45 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > Commit 833740a2333c ("platform/chrome: sensorhub: Bound the EC-reported
> > sensor number") evaluated the `sensor_num` against the bounds limit even
> > for timestamp events.  A timestamp event typically has a `sensor_num` of
> > 0xff [1], causing the driver to flag it as invalid and skip to the next
> > event.
> >
> > As a result, we'd see a flooding of "Invalid sensor number 255 from EC"
> > warning logs and these timestamp events were being dropped.
> >
> > Move the bounds-check into cros_ec_sensor_ring_process_event() and
> > evaluate it only after standalone timestamp events have already been
> > processed and returned early.
> >
> > [1] https://crrev.com/219ca6ef82ba266da788b673ee4ad50bd3ea1285/common/motion_sense_fifo.c#427
> >
> > Fixes: 833740a2333c ("platform/chrome: sensorhub: Bound the EC-reported sensor number")
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > ---
> > Bryam: sorry for reverting the decision (moving back the check to
> > cros_ec_sensor_ring_process_event()).  I realized we need to prevent
> > dropping timestamp events and flooding the logs.
> > ---
> > v2:
> > - Move the check to cros_ec_sensor_ring_process_event().
> > - Return earlier for standalone timestamp events.
> >
> > v1: https://lore.kernel.org/all/20260714065202.3248017-1-tzungbi@kernel.org
> > ---
> >  .../platform/chrome/cros_ec_sensorhub_ring.c  | 27 ++++++++++---------
> >  1 file changed, 15 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> > index 92941924c347..d92b60213720 100644
> > --- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> > +++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> > @@ -475,6 +475,21 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sensorhub *sensorhub,
> >                                                   fifo_timestamp,
> >                                                   *current_timestamp,
> >                                                   now);
> > +
> > +               /*
> > +                * A standalone timestamp event typically has a sensor_num of
> > +                * 0xff.  Return early here to prevent it from hitting the
> > +                * bounds check below and spamming the logs.
> > +                */
> > +               return false;
> > +       }
> > +
> > +       /* Skip event if sensor_num from EC is out of bounds. */
> > +       if (in->sensor_num >= sensorhub->sensor_num) {
> > +               dev_warn_ratelimited(sensorhub->dev,
> > +                                    "Invalid sensor number %u from EC\n",
> > +                                    in->sensor_num);
> > +               return false;
> >         }
> >
> >         if (in->flags & MOTIONSENSE_SENSOR_FLAG_ODR) {
> > @@ -502,10 +517,6 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sensorhub *sensorhub,
> >                 return true;
> >         }
> >
> > -       if (in->flags & MOTIONSENSE_SENSOR_FLAG_TIMESTAMP)
> > -               /* If we just have a timestamp, skip this entry. */
> > -               return false;
> > -
> 
> Isn't this still needed for the case of
> MOTIONSENSE_SENSOR_FLAG_TIMESTAMP and (MOTIONSENSE_SENSOR_FLAG_ODR
> and/or MOTIONSENSE_SENSOR_FLAG_FLUSH)?

The block serves for standalone MOTIONSENSE_SENSOR_FLAG_TIMESTAMP events.
If the flags contains ODR or FLUSH, it returns in other branches.

After applying the patch, the flow of cros_ec_sensor_ring_process_event()
looks like:

  If TIMESTAMP but (!ODR and !FLUSH):
     ...
     return   <--- The patch merges the block and returns early.

  Check bounds for sensor_num

  If ODR:
     ...
     return

  If FLUSH:
     ...
     return
