Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A0E377014;
	Tue,  3 Mar 2026 02:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772506193; cv=none; b=LBNqUsiA1+uWpHqSMkyzWdcsLsJZIN0nR14VEu8n9PnQxfqyjRwfTTb3KzrPg6YmO8FtGC67rJHrHU8Hh7baAKbGeQrfIYoZht5Q2B7ZLjO7aHQtITb52N5HlzkpdPXI0rfcl1WqlSIbEka36EqDV5orCRsckFVyPRm0uUnN3ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772506193; c=relaxed/simple;
	bh=LbQsYDntem+l4KsRVcmm8P7sWGrFmTZDT9CJasq0oms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTVf3n1tcpcxgrk3ckXXN9XIRnRulXGyb6yNbqg8lLkzV7aAH3ho5CfyZbnf/t2F1LF1zeaSKLzjTuDjACdxgRLrOoQUeu/6zpmUQCclPNLP0+9IGA1p+lcVQU5aIJShxm6Hs8g3p+2YECDH3lPpoZF/PipHDgWd5ygeV0aYxmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j0v0TY3u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j0v0TY3u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3996C19423;
	Tue,  3 Mar 2026 02:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772506192;
	bh=LbQsYDntem+l4KsRVcmm8P7sWGrFmTZDT9CJasq0oms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j0v0TY3u8KvO+uXYcsLaCcRe8rR4Gs55QWH9dAsACyOhaxK8e4men3BsikHVGzjcS
	 mKWyzvkUhQAr1oXOya2hraxP1l9q8eT9BQOQD+OCtxxTaoGfr4KKt3VPmEZdY0U1ot
	 rTaZqIBpVBBKbpZSD8IB045bkpXZrJV7EzTRcDHlMRE05S7Dwb4JH0wdP/Qt+53SY/
	 eLuVGtnQ8SFXR6AEPLsvBxQpf1/JUihI78YIfdh5FaHGpUR8FAooRK2faGDGgt/voW
	 IQW2Sxji6fQ/ZQWuiAXtNZrvjEj7gLquNBo7xaAT/+B29XPZyNXOPVy/4+kbEIlfJt
	 JpFviOk6JZs+w==
Date: Tue, 3 Mar 2026 02:49:49 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Skip Type-C mux handling
 in EC-driven devices
Message-ID: <aaZMTeDLJapkPSli@google.com>
References: <20260205-smaug-type_c-v1-1-d6e556bf6640@tecnico.ulisboa.pt>
 <a274ceda-1763-4022-bb7f-132967ad66c8@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a274ceda-1763-4022-bb7f-132967ad66c8@tecnico.ulisboa.pt>

On Mon, Mar 02, 2026 at 09:09:22AM +0000, Diogo Ivo wrote:
> Hello,
> 
> Gentle ping on this patch.

CHROMEOS EC USB TYPE-C DRIVER maintainers: Could you take a look on the patch?

> 
> On 2/5/26 10:04, Diogo Ivo wrote:
> > Currently the code assumes that the EC firmware will leave Type-C mux
> > handling logic to the AP, exposing an interface to query and change the
> > mux state via a request from the AP. However, in devices such as Smaug
> > the EC automatically takes care of mux configuration and only USB role
> > switching needs to be handled by the AP. In fact, in such devices this
> > interface is not exposed by the EC making the whole process fail,
> > including role switching.
> > 
> > Fix this by first separating Type-C mux handling and USB role switching,
> > explicitly querying the behaviour of the EC and execute each part
> > conditionally according to what the EC reported.
> > 
> > Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> > ---
> >   drivers/platform/chrome/cros_ec_typec.c | 49 +++++++++++++++++++++++----------
> >   drivers/platform/chrome/cros_ec_typec.h |  2 +-
> >   2 files changed, 35 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> > index b712bcff6fb2..bd7e6c365cab 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.c
> > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > @@ -751,11 +751,10 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
> >   	}
> >   	/* No change needs to be made, let's exit early. */
> > -	if (port->mux_flags == resp.flags && port->role == pd_ctrl->role)
> > +	if (port->mux_flags == resp.flags)
> >   		return 0;
> >   	port->mux_flags = resp.flags;
> > -	port->role = pd_ctrl->role;
> >   	if (port->mux_flags == USB_PD_MUX_NONE) {
> >   		ret = cros_typec_usb_disconnect_state(port);
> > @@ -771,12 +770,6 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
> >   	if (ret)
> >   		return ret;
> > -	ret = usb_role_switch_set_role(typec->ports[port_num]->role_sw,
> > -					pd_ctrl->role & PD_CTRL_RESP_ROLE_DATA
> > -					? USB_ROLE_HOST : USB_ROLE_DEVICE);
> > -	if (ret)
> > -		return ret;
> > -
> >   	if (port->mux_flags & USB_PD_MUX_USB4_ENABLED) {
> >   		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
> >   	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
> > @@ -822,6 +815,25 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
> >   	return ret;
> >   }
> > +static int cros_typec_set_role(struct cros_typec_data *typec, int port_num,
> > +			       struct ec_response_usb_pd_control_v1 *resp)
> > +{
> > +	enum usb_role cur_role = usb_role_switch_get_role(typec->ports[port_num]->role_sw);
> > +	enum usb_role role = resp->role & PD_CTRL_RESP_ROLE_DATA ? USB_ROLE_HOST :
> > +								   USB_ROLE_DEVICE;
> > +	bool connected = resp->enabled & PD_CTRL_RESP_ENABLED_CONNECTED;
> > +	int ret;
> > +
> > +	if (!connected || cur_role == role)
> > +		return 0;
> > +
> > +	ret = usb_role_switch_set_role(typec->ports[port_num]->role_sw, role);
> > +	if (ret)
> > +		dev_err(typec->dev, "Failed USB role switch, err = %d\n", ret);
> > +
> > +	return ret;
> > +}
> > +
> >   static void cros_typec_set_port_params_v0(struct cros_typec_data *typec,
> >   		int port_num, struct ec_response_usb_pd_control *resp)
> >   {
> > @@ -1251,27 +1263,32 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
> >   	if (ret < 0)
> >   		return ret;
> > -	/* Update the switches if they exist, according to requested state */
> > -	ret = cros_typec_configure_mux(typec, port_num, &resp);
> > -	if (ret)
> > -		dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
> > +	if (typec->ap_driven_mux) {
> > +		/* Update the switches if they exist, according to requested state */
> > +		ret = cros_typec_configure_mux(typec, port_num, &resp);
> > +		if (ret)
> > +			dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
> > +	}
> >   	dev_dbg(typec->dev, "Enabled %d: 0x%hhx\n", port_num, resp.enabled);
> >   	dev_dbg(typec->dev, "Role %d: 0x%hhx\n", port_num, resp.role);
> >   	dev_dbg(typec->dev, "Polarity %d: 0x%hhx\n", port_num, resp.polarity);
> >   	dev_dbg(typec->dev, "State %d: %s\n", port_num, resp.state);
> > -	if (typec->pd_ctrl_ver != 0)
> > +	if (typec->pd_ctrl_ver != 0) {
> > +		ret = cros_typec_set_role(typec, port_num,
> > +			(struct ec_response_usb_pd_control_v1 *)&resp);
> >   		cros_typec_set_port_params_v1(typec, port_num,
> >   			(struct ec_response_usb_pd_control_v1 *)&resp);
> > -	else
> > +	} else {
> >   		cros_typec_set_port_params_v0(typec, port_num,
> >   			(struct ec_response_usb_pd_control *) &resp);
> > +	}
> >   	if (typec->typec_cmd_supported)
> >   		cros_typec_handle_status(typec, port_num);
> > -	return 0;
> > +	return ret;
> >   }
> >   static int cros_typec_get_cmd_version(struct cros_typec_data *typec)
> > @@ -1375,6 +1392,8 @@ static int cros_typec_probe(struct platform_device *pdev)
> >   	typec->needs_mux_ack = cros_ec_check_features(ec_dev, EC_FEATURE_TYPEC_MUX_REQUIRE_AP_ACK);
> >   	typec->ap_driven_altmode = cros_ec_check_features(
> >   		ec_dev, EC_FEATURE_TYPEC_REQUIRE_AP_MODE_ENTRY);
> > +	typec->ap_driven_mux = cros_ec_check_features(
> > +		ec_dev, EC_FEATURE_USBC_SS_MUX_VIRTUAL);
> >   	ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_PORTS, NULL, 0,
> >   			  &resp, sizeof(resp));
> > diff --git a/drivers/platform/chrome/cros_ec_typec.h b/drivers/platform/chrome/cros_ec_typec.h
> > index f9c31f04c102..9698f27169c6 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.h
> > +++ b/drivers/platform/chrome/cros_ec_typec.h
> > @@ -41,6 +41,7 @@ struct cros_typec_data {
> >   	bool typec_cmd_supported;
> >   	bool needs_mux_ack;
> >   	bool ap_driven_altmode;
> > +	bool ap_driven_mux;
> >   };
> >   /* Per port data. */
> > @@ -65,7 +66,6 @@ struct cros_typec_port {
> >   	/* Variables keeping track of switch state. */
> >   	struct typec_mux_state state;
> >   	uint8_t mux_flags;
> > -	uint8_t role;
> >   	struct typec_altmode *port_altmode[CROS_EC_ALTMODE_MAX];
> > 
> > ---
> > base-commit: 1cf43b664b8b2f9cd04b9906193713e4b693dac7
> > change-id: 20260128-smaug-type_c-d34b9510fb5e
> > 
> > Best regards,
> 
