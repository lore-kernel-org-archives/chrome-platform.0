Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8A4385503
	for <chrome-platform@lists.linux.dev>; Mon,  2 Mar 2026 09:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442582; cv=none; b=B1NBJct3yoZ84M5JFLmCs55AIWwCZCZ0n2kzujanqP0GUSZADBtfK6akulKXcklQv6Zml+EX01invg0Mg3rK/rfsDqsOVdpyPNSutvRjJ3zzdeW9P/zdSqCD1VxtvDdiqO1DCYQPcCro7PTuE20sFa19eXs4ukze0xA7XpKpoy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442582; c=relaxed/simple;
	bh=pH5Kh1qpUROYkgWEcp9BM7IIKkua1S/jRgNWknPScTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qAjS5LfSuHFKOTlORfQoQFeVkb2FsuFfTp+dZHfP5IJqDNFadWvCCY1PZadKJFb88U0O4/5jPFcRWueHR44AnZfr3VSaZnhmFApRD6DpnYfYL73pJl3rCgpq0MAEkiSGFZe1v6XVsuV2iU4VS60ItCvmaVySHvrimjnxeMSJfjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=YgjVSkHK; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="YgjVSkHK"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 1C22C6002990;
	Mon,  2 Mar 2026 09:09:37 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id AfS5P6tMWhEz; Mon,  2 Mar 2026 09:09:34 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 902D56002988;
	Mon,  2 Mar 2026 09:09:34 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1772442574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=toLsGZqHGblj9vyzR8vRrNNHerk8pk2a+tJO+OetlLU=;
	b=YgjVSkHKua4ZS7pzT4Hn9vj5KwQiFk13pVoKlMV72rU4i9nEaqLTJyWyxytOk7BVYDZmW3
	ETF9TO+7W753nETgcJYoThntVLZ4ROycap+xNUuayGXJtg4O707jduh3R0HbNSauGexoni
	FLY0rgNkoXVMRuG4Z/NQXy+xgHD3/pB4UPDHNMjfSpnHHuxTYrLnnwZPItoPhKblkv6lsH
	5a0sOHuY1gLLP4sTHErrRB0umg1EE4JEM//RkUge3OFzZ9GRbVtcvnB1nKYVJ3EXtwf1s7
	Vysy/dDXUSnQ/EQddY8Hyy24wjTeR1Gi+6rA4NYW/SQ3fbv8cAnpS06HfjSpzQ==
Received: from [IPV6:2001:8a0:fbec:a900:2c09:2fb0:9be7:36e0] (unknown [IPv6:2001:8a0:fbec:a900:2c09:2fb0:9be7:36e0])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id CCBA636013D;
	Mon,  2 Mar 2026 09:09:33 +0000 (WET)
Message-ID: <a274ceda-1763-4022-bb7f-132967ad66c8@tecnico.ulisboa.pt>
Date: Mon, 2 Mar 2026 09:09:22 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Skip Type-C mux handling
 in EC-driven devices
To: Benson Leung <bleung@chromium.org>,
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 Jameson Thies <jthies@google.com>, Andrei Kuchynski
 <akuchynski@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260205-smaug-type_c-v1-1-d6e556bf6640@tecnico.ulisboa.pt>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <20260205-smaug-type_c-v1-1-d6e556bf6640@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Gentle ping on this patch.

Best regards,
Diogo

On 2/5/26 10:04, Diogo Ivo wrote:
> Currently the code assumes that the EC firmware will leave Type-C mux
> handling logic to the AP, exposing an interface to query and change the
> mux state via a request from the AP. However, in devices such as Smaug
> the EC automatically takes care of mux configuration and only USB role
> switching needs to be handled by the AP. In fact, in such devices this
> interface is not exposed by the EC making the whole process fail,
> including role switching.
> 
> Fix this by first separating Type-C mux handling and USB role switching,
> explicitly querying the behaviour of the EC and execute each part
> conditionally according to what the EC reported.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>   drivers/platform/chrome/cros_ec_typec.c | 49 +++++++++++++++++++++++----------
>   drivers/platform/chrome/cros_ec_typec.h |  2 +-
>   2 files changed, 35 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index b712bcff6fb2..bd7e6c365cab 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -751,11 +751,10 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
>   	}
>   
>   	/* No change needs to be made, let's exit early. */
> -	if (port->mux_flags == resp.flags && port->role == pd_ctrl->role)
> +	if (port->mux_flags == resp.flags)
>   		return 0;
>   
>   	port->mux_flags = resp.flags;
> -	port->role = pd_ctrl->role;
>   
>   	if (port->mux_flags == USB_PD_MUX_NONE) {
>   		ret = cros_typec_usb_disconnect_state(port);
> @@ -771,12 +770,6 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
>   	if (ret)
>   		return ret;
>   
> -	ret = usb_role_switch_set_role(typec->ports[port_num]->role_sw,
> -					pd_ctrl->role & PD_CTRL_RESP_ROLE_DATA
> -					? USB_ROLE_HOST : USB_ROLE_DEVICE);
> -	if (ret)
> -		return ret;
> -
>   	if (port->mux_flags & USB_PD_MUX_USB4_ENABLED) {
>   		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
>   	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
> @@ -822,6 +815,25 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
>   	return ret;
>   }
>   
> +static int cros_typec_set_role(struct cros_typec_data *typec, int port_num,
> +			       struct ec_response_usb_pd_control_v1 *resp)
> +{
> +	enum usb_role cur_role = usb_role_switch_get_role(typec->ports[port_num]->role_sw);
> +	enum usb_role role = resp->role & PD_CTRL_RESP_ROLE_DATA ? USB_ROLE_HOST :
> +								   USB_ROLE_DEVICE;
> +	bool connected = resp->enabled & PD_CTRL_RESP_ENABLED_CONNECTED;
> +	int ret;
> +
> +	if (!connected || cur_role == role)
> +		return 0;
> +
> +	ret = usb_role_switch_set_role(typec->ports[port_num]->role_sw, role);
> +	if (ret)
> +		dev_err(typec->dev, "Failed USB role switch, err = %d\n", ret);
> +
> +	return ret;
> +}
> +
>   static void cros_typec_set_port_params_v0(struct cros_typec_data *typec,
>   		int port_num, struct ec_response_usb_pd_control *resp)
>   {
> @@ -1251,27 +1263,32 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
>   	if (ret < 0)
>   		return ret;
>   
> -	/* Update the switches if they exist, according to requested state */
> -	ret = cros_typec_configure_mux(typec, port_num, &resp);
> -	if (ret)
> -		dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
> +	if (typec->ap_driven_mux) {
> +		/* Update the switches if they exist, according to requested state */
> +		ret = cros_typec_configure_mux(typec, port_num, &resp);
> +		if (ret)
> +			dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
> +	}
>   
>   	dev_dbg(typec->dev, "Enabled %d: 0x%hhx\n", port_num, resp.enabled);
>   	dev_dbg(typec->dev, "Role %d: 0x%hhx\n", port_num, resp.role);
>   	dev_dbg(typec->dev, "Polarity %d: 0x%hhx\n", port_num, resp.polarity);
>   	dev_dbg(typec->dev, "State %d: %s\n", port_num, resp.state);
>   
> -	if (typec->pd_ctrl_ver != 0)
> +	if (typec->pd_ctrl_ver != 0) {
> +		ret = cros_typec_set_role(typec, port_num,
> +			(struct ec_response_usb_pd_control_v1 *)&resp);
>   		cros_typec_set_port_params_v1(typec, port_num,
>   			(struct ec_response_usb_pd_control_v1 *)&resp);
> -	else
> +	} else {
>   		cros_typec_set_port_params_v0(typec, port_num,
>   			(struct ec_response_usb_pd_control *) &resp);
> +	}
>   
>   	if (typec->typec_cmd_supported)
>   		cros_typec_handle_status(typec, port_num);
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static int cros_typec_get_cmd_version(struct cros_typec_data *typec)
> @@ -1375,6 +1392,8 @@ static int cros_typec_probe(struct platform_device *pdev)
>   	typec->needs_mux_ack = cros_ec_check_features(ec_dev, EC_FEATURE_TYPEC_MUX_REQUIRE_AP_ACK);
>   	typec->ap_driven_altmode = cros_ec_check_features(
>   		ec_dev, EC_FEATURE_TYPEC_REQUIRE_AP_MODE_ENTRY);
> +	typec->ap_driven_mux = cros_ec_check_features(
> +		ec_dev, EC_FEATURE_USBC_SS_MUX_VIRTUAL);
>   
>   	ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_PORTS, NULL, 0,
>   			  &resp, sizeof(resp));
> diff --git a/drivers/platform/chrome/cros_ec_typec.h b/drivers/platform/chrome/cros_ec_typec.h
> index f9c31f04c102..9698f27169c6 100644
> --- a/drivers/platform/chrome/cros_ec_typec.h
> +++ b/drivers/platform/chrome/cros_ec_typec.h
> @@ -41,6 +41,7 @@ struct cros_typec_data {
>   	bool typec_cmd_supported;
>   	bool needs_mux_ack;
>   	bool ap_driven_altmode;
> +	bool ap_driven_mux;
>   };
>   
>   /* Per port data. */
> @@ -65,7 +66,6 @@ struct cros_typec_port {
>   	/* Variables keeping track of switch state. */
>   	struct typec_mux_state state;
>   	uint8_t mux_flags;
> -	uint8_t role;
>   
>   	struct typec_altmode *port_altmode[CROS_EC_ALTMODE_MAX];
>   
> 
> ---
> base-commit: 1cf43b664b8b2f9cd04b9906193713e4b693dac7
> change-id: 20260128-smaug-type_c-d34b9510fb5e
> 
> Best regards,
