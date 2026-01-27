Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F50227BB5
	for <chrome-platform@lists.linux.dev>; Tue, 27 Jan 2026 06:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769494168; cv=none; b=cQ3RHOYi5dbUXfBeg4lvEL6YQWzhITMW11Xs16/bAeXSRFU/vyz2Exswa8LL2VSULJ9lbQwTifghg7z7f5xCWlBu657HS6q7lwk4LUXsBpRZKF5K37yKCtk1iz38WRxgVbye/UVDEzv16Q6H4t9F/j+Arx9lwetut9qc7VMgs8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769494168; c=relaxed/simple;
	bh=PFMT/yLfPeyX5Bki49H8e1guaKRM0OnywkEmYqqoJJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDoI5d6pywPrYweDIqpKKkEy7ycy1HSbC1thjcZezsDedVy27xtVhoMzVAf5XkamnpqzeHmk5zTYb5SPJ7RB88Dbg1kufEkuH3TR8FVMJ0OT0QCuuBDoUdFaqBJfilahFsVjCMJ1iI6Wg+kwfostmZopVoV/jf3UeIJogSsKkl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJN58a/v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJN58a/v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B513BC116C6;
	Tue, 27 Jan 2026 06:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769494168;
	bh=PFMT/yLfPeyX5Bki49H8e1guaKRM0OnywkEmYqqoJJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EJN58a/vftTQ+rkGItem3m4k6ijzZ9INtoEDs3zVEcIkYGabXGLMjSPMDI1njC16A
	 PTCAvllShL8Gu1Ap0P9anr6MmV6Bjh/FnQzwh5sX/a2MoRiUlboZb4R9oghSFyGJrH
	 KH0/IUEDV/5ZZRLc1qvAejnUpcte5RGwZWZIjfB3XetW0/ACWEkTwlhqKUPhaBrSH2
	 BHRE17iSFrkQR8iYu8BOBu64GJSYccK4Oih/HYaNzqz1H0E+ckVE5RGBwwb1U7eGCe
	 EqIw/4wh2vaBhq3o7OP+W35ssYKqah70RK5Afgj8zylWA2XtCaWPa4Prf2oP5Is5TF
	 3hunohrnaGM0Q==
Date: Tue, 27 Jan 2026 06:09:25 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@google.com>
Cc: Gwendal Grignou <gwendal@chromium.org>, chrome-platform@lists.linux.dev
Subject: Re: [PATCH 2/2] chrome: lightbar: Add support for large sequence
Message-ID: <aXhWlV6SyaAAum-Q@google.com>
References: <20260124085914.836564-1-gwendal@google.com>
 <aXcUQiEOU-bfj28W@google.com>
 <CAMHSBOUN0RobxFG0SA-SgXeRa6nqObBeqaWuJaRphySM886=bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMHSBOUN0RobxFG0SA-SgXeRa6nqObBeqaWuJaRphySM886=bg@mail.gmail.com>

On Mon, Jan 26, 2026 at 01:19:16AM -0800, Gwendal Grignou wrote:
> On Sun, Jan 25, 2026 at 11:14 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > On Sat, Jan 24, 2026 at 12:59:14AM -0800, Gwendal Grignou wrote:
> > > @@ -478,14 +484,22 @@ static ssize_t program_store(struct device *dev, struct device_attribute *attr,
> > >        * and send a program that is too big for the protocol. In order
> > >        * to ensure the latter, we also need to ensure we have extra bytes
> > >        * to represent the rest of the packet.
> > > +      * With V3, larger program can be sent, limited only by the EC.
> > > +      * Only the protocol limit the payload size.
> > >        */
> > > -     extra_bytes = sizeof(*param) - sizeof(param->set_program.data);
> > > -     max_size = min(EC_LB_PROG_LEN, ec->ec_dev->max_request - extra_bytes);
> > > -     if (count > max_size) {
> > > -             dev_err(dev, "Program is %u bytes, too long to send (max: %u)",
> > > -                     (unsigned int)count, max_size);
> > > -
> > > -             return -EINVAL;
> > > +     if (lb_version < 3) {
> > > +             extra_bytes = sizeof(*param) - sizeof(param->set_program.data);
> > > +             max_size = min(EC_LB_PROG_LEN, ec->ec_dev->max_request - extra_bytes);
> > > +             if (count > max_size) {
> > > +                     dev_err(dev, "Program is %zu bytes, too long to send (max: %zu)",
> > > +                                     count, max_size);
> > > +
> > > +                     return -EINVAL;
> > > +             }
> > > +     } else {
> > > +             extra_bytes = sizeof(*param) - sizeof(param->set_program) +
> > > +                     sizeof(param->set_program_ex);
> >
> > I don't understand the code.  What does `extra_bytes` want to count here?
> > Why `sizeof(param->set_program)` is involved?  I thought it should be:
> >
> >   extra_bytes = sizeof(*param) - sizeof(param->set_program_ex.data);
> `set_program_ex.data` is a variable array of size 0.
> `set_program.data` is a real array set to 192.
> |*param| does contain the payload array for `set_program`, so we need
> to remove it first to calculate our payload:
> 
> 0 ----a ------- x --------------- 192+x -- maximal command size
> |    sizeof(*param)                |     <<<< size of the whole command
> |     | sizeof(set_program)        |     <<<< size of the largest subcommand
> |     | .._ex   |
> |  extra_bytes  | available for the payload |

It looks fragile as it knows `set_program` is the largest member in the
union in advance.  How about something like:

  extra_bytes = offsetof(typeof(*param), set_program_ex) +
		sizeof(param->set_program_ex);

> > > diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
> > > +struct lightbar_program_ex {
> > > +     uint16_t offset;
> > > +     uint8_t size;
> > > +     uint8_t data[EC_LB_PROG_LEN];
> I see the problem: it should be [0] here. I tested with 0, I messed up
> during "cleanup" when synchronising between firmware and kernel.

Yeah, I was confused by it.

For the case, I think the content has to diverge from the firmware's header.

The flexible array member `data` should be annotated with __counted_by().

AFAIK, there is/was an on-going effort for avoiding
-Wflex-array-member-not-at-end warnings.  E.g., a26c23e0d679
("KEYS: Avoid -Wflex-array-member-not-at-end warning").  Please take a look
if it needs to leverage any flex helpers.
